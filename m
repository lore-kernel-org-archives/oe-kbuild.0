Content-Type: multipart/mixed; boundary="===============0652028736865133657=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/3] [v3] Kbuild: move to -std=gnu11
Date: Fri, 04 Mar 2022 10:47:36 +0800
Message-ID: <202203040957.H2ndD30L-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0652028736865133657==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220301145233.3689119-1-arnd@kernel.org>
References: <20220301145233.3689119-1-arnd@kernel.org>
TO: Arnd Bergmann <arnd@kernel.org>
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Marco Elver <elver@google.com>
CC: Jani Nikula <jani.nikula@intel.com>
CC: David Sterba <dsterba@suse.com>
CC: Alex Shi <alexs@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: linux-kbuild(a)vger.kernel.org
CC: llvm(a)lists.linux.dev
CC: linux-doc(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi Arnd,

I love your patch! Perhaps something to improve:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on masahiroy-kbuild/for-next drm-intel/for-linux-n=
ext staging/staging-testing kdave/for-next soc/for-next linus/master v5.17-=
rc6 next-20220303]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Arnd-Bergmann/Kbuild-move-=
to-std-gnu11/20220301-225348
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for=
-next/core
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-c002-20220302 (https://download.01.org/0day-ci/archi=
ve/20220304/202203040957.H2ndD30L-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/afebabb39f6a871f6e6d69f60=
1738fbce1c1b37c
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Arnd-Bergmann/Kbuild-move-to-std-g=
nu11/20220301-225348
        git checkout afebabb39f6a871f6e6d69f601738fbce1c1b37c
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2225:2: note: Taking false =
branch
           if (!hw->buff)
           ^
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2233:6: note: 'err' is >=3D=
 0
           if (err < 0)
               ^~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2233:2: note: Taking false =
branch
           if (err < 0)
           ^
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2236:2: note: Loop conditio=
n is true.  Entering loop body
           for (i =3D 0; i < ST_LSM6DSX_ID_EXT0; i++) {
           ^
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2238:3: note: Taking false =
branch
                   if (!hw->iio_devs[i])
                   ^
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2236:2: note: Loop conditio=
n is true.  Entering loop body
           for (i =3D 0; i < ST_LSM6DSX_ID_EXT0; i++) {
           ^
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2238:3: note: Taking false =
branch
                   if (!hw->iio_devs[i])
                   ^
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2236:2: note: Loop conditio=
n is false. Execution continues on line 2242
           for (i =3D 0; i < ST_LSM6DSX_ID_EXT0; i++) {
           ^
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2242:8: note: Calling 'st_l=
sm6dsx_init_device'
           err =3D st_lsm6dsx_init_device(hw);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:1926:6: note: 'err' is >=3D=
 0
           if (err < 0)
               ^~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:1926:2: note: Taking false =
branch
           if (err < 0)
           ^
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:1933:6: note: Assuming 'err=
' is >=3D 0
           if (err < 0)
               ^~~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:1933:2: note: Taking false =
branch
           if (err < 0)
           ^
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:1938:6: note: 'err' is >=3D=
 0
           if (err < 0)
               ^~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:1938:2: note: Taking false =
branch
           if (err < 0)
           ^
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:1943:6: note: Assuming 'err=
' is >=3D 0
           if (err < 0)
               ^~~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:1943:2: note: Taking false =
branch
           if (err < 0)
           ^
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:1947:6: note: Assuming fiel=
d 'addr' is 0
           if (hw->settings->irq_config.lir.addr) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:1947:2: note: Taking false =
branch
           if (hw->settings->irq_config.lir.addr) {
           ^
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:1966:6: note: Assuming fiel=
d 'addr' is 0
           if (hw->settings->drdy_mask.addr) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:1966:2: note: Taking false =
branch
           if (hw->settings->drdy_mask.addr) {
           ^
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:1974:8: note: Calling 'st_l=
sm6dsx_init_shub'
           err =3D st_lsm6dsx_init_shub(hw);
                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:1781:7: note: Assuming the =
condition is false
           if ((dev_fwnode(dev) && device_property_read_bool(dev, "st,pullu=
ps")) ||
                ^~~~~~~~~~~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:1781:23: note: Left side of=
 '&&' is false
           if ((dev_fwnode(dev) && device_property_read_bool(dev, "st,pullu=
ps")) ||
                                ^
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:1782:7: note: Assuming 'pda=
ta' is null
               (pdata && pdata->pullups)) {
                ^~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:1782:13: note: Left side of=
 '&&' is false
               (pdata && pdata->pullups)) {
                      ^
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:1801:6: note: Assuming fiel=
d 'addr' is not equal to 0
           if (hub_settings->aux_sens.addr) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:1801:2: note: Taking true b=
ranch
           if (hub_settings->aux_sens.addr) {
           ^
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:1804:7: note: Assuming 'err=
' is >=3D 0
                   if (err < 0)
                       ^~~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:1804:3: note: Taking false =
branch
                   if (err < 0)
                   ^
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:1807:10: note: The result o=
f the left shift is undefined due to shifting '3' by '31', which is unrepre=
sentable in the unsigned version of the return type 'int'
                   data =3D ST_LSM6DSX_SHIFT_VAL(3, hub_settings->aux_sens.=
mask);
                          ^
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h:65:49: note: expanded from macro=
 'ST_LSM6DSX_SHIFT_VAL'
   #define ST_LSM6DSX_SHIFT_VAL(val, mask) (((val) << __ffs(mask)) & (mask))
                                             ~~~~~ ^
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
>> drivers/hwtracing/coresight/coresight-cpu-debug.c:514:2: warning: Call t=
o function 'snprintf' is insecure as it does not provide security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'snprintf_s' in case =
of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandlin=
g]
           snprintf(buf, sizeof(buf), "%d\n", debug_enable);
           ^~~~~~~~
   drivers/hwtracing/coresight/coresight-cpu-debug.c:514:2: note: Call to f=
unction 'snprintf' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'snprintf_s' in case of =
C11
           snprintf(buf, sizeof(buf), "%d\n", debug_enable);
           ^~~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/hwtracing/coresight/coresight-catu.c:232:4: warning: Call to fun=
ction 'memset' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memset_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(&table_ptr[i], 0,
                           ^~~~~~
   drivers/hwtracing/coresight/coresight-catu.c:232:4: note: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11
                           memset(&table_ptr[i], 0,
                           ^~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/hwtracing/coresight/coresight-cti-core.c:447:2: warning: Value s=
tored to 'reg_value' is never read [clang-analyzer-deadcode.DeadStores]
           reg_value =3D config->ctiappset;
           ^           ~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-cti-core.c:447:2: note: Value stor=
ed to 'reg_value' is never read
           reg_value =3D config->ctiappset;
           ^           ~~~~~~~~~~~~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   84 warnings generated.
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:94:10: warning: Call t=
o function 'sprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "%d\n", enabled);
                          ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:94:10: note: Call to f=
unction 'sprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "%d\n", enabled);
                          ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:96:10: warning: Call t=
o function 'sprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "%d\n", !!enable_req);
                          ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:96:10: note: Call to f=
unction 'sprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "%d\n", !!enable_req);
                          ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:132:9: warning: Call t=
o function 'sprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", powered);
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:132:9: note: Call to f=
unction 'sprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", powered);
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:141:9: warning: Call t=
o function 'sprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", drvdata->ctidev.ctm_id);
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:141:9: note: Call to f=
unction 'sprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", drvdata->ctidev.ctm_id);
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:151:9: warning: Call t=
o function 'sprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", drvdata->ctidev.nr_trig_con);
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:151:9: note: Call to f=
unction 'sprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", drvdata->ctidev.nr_trig_con);
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:184:1: warning: Call t=
o function 'sprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   coresight_cti_reg(devaff0, CTIDEVAFF0);
   ^
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:179:9: note: expanded =
from macro 'coresight_cti_reg'
           return sprintf(buf, "0x%x\n", val);                             \
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:184:1: note: Call to f=
unction 'sprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C11
   coresight_cti_reg(devaff0, CTIDEVAFF0);
   ^
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:179:9: note: expanded =
from macro 'coresight_cti_reg'
           return sprintf(buf, "0x%x\n", val);                             \
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:185:1: warning: Call t=
o function 'sprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   coresight_cti_reg(devaff1, CTIDEVAFF1);
   ^
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:179:9: note: expanded =
from macro 'coresight_cti_reg'
           return sprintf(buf, "0x%x\n", val);                             \
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:185:1: note: Call to f=
unction 'sprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C11
   coresight_cti_reg(devaff1, CTIDEVAFF1);
   ^
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:179:9: note: expanded =
from macro 'coresight_cti_reg'
           return sprintf(buf, "0x%x\n", val);                             \
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:186:1: warning: Call t=
o function 'sprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   coresight_cti_reg(authstatus, CORESIGHT_AUTHSTATUS);
   ^
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:179:9: note: expanded =
from macro 'coresight_cti_reg'
           return sprintf(buf, "0x%x\n", val);                             \
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:186:1: note: Call to f=
unction 'sprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C11
   coresight_cti_reg(authstatus, CORESIGHT_AUTHSTATUS);
   ^
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:179:9: note: expanded =
from macro 'coresight_cti_reg'
           return sprintf(buf, "0x%x\n", val);                             \
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:187:1: warning: Call t=
o function 'sprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   coresight_cti_reg(devarch, CORESIGHT_DEVARCH);
   ^
   drivers/hwtracing/coresight/coresight-cti-sysfs.c:179:9: note: expanded =
from macro 'coresight_cti_reg'
           return sprintf(buf, "0x%x\n", val);                             \
--
   drivers/hwtracing/intel_th/gth.c:335:10: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
           count =3D snprintf(buf, PAGE_SIZE, "%x\n",
                   ^~~~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   sound/soc/codecs/wsa881x.c:747:25: warning: The result of the left shift=
 is undefined due to shifting by '32', which is greater or equal to the wid=
th of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           unsigned int mask =3D (1 << fls(max)) - 1;
                                  ^  ~~~~~~~~
   sound/soc/codecs/wsa881x.c:747:28: note: Calling 'fls'
           unsigned int mask =3D (1 << fls(max)) - 1;
                                     ^~~~~~~~
   include/asm-generic/bitops/fls.h:15:2: note: 'r' initialized to 32
           int r =3D 32;
           ^~~~~
   include/asm-generic/bitops/fls.h:17:6: note: Assuming 'x' is not equal t=
o 0, which participates in a condition later
           if (!x)
               ^~
   include/asm-generic/bitops/fls.h:17:2: note: Taking false branch
           if (!x)
           ^
   include/asm-generic/bitops/fls.h:19:6: note: Assuming the condition is f=
alse
           if (!(x & 0xffff0000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:19:2: note: Taking false branch
           if (!(x & 0xffff0000u)) {
           ^
   include/asm-generic/bitops/fls.h:23:6: note: Assuming the condition is f=
alse
           if (!(x & 0xff000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:23:2: note: Taking false branch
           if (!(x & 0xff000000u)) {
           ^
   include/asm-generic/bitops/fls.h:27:6: note: Assuming the condition is f=
alse
           if (!(x & 0xf0000000u)) {
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
   include/asm-generic/bitops/fls.h:39:2: note: Returning the value 32 (loa=
ded from 'r')
           return r;
           ^~~~~~~~
   sound/soc/codecs/wsa881x.c:747:28: note: Returning from 'fls'
           unsigned int mask =3D (1 << fls(max)) - 1;
                                     ^~~~~~~~
   sound/soc/codecs/wsa881x.c:747:25: note: The result of the left shift is=
 undefined due to shifting by '32', which is greater or equal to the width =
of type 'int'
           unsigned int mask =3D (1 << fls(max)) - 1;
                                  ^  ~~~~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   sound/soc/codecs/cx2072x.c:503:2: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf + 2, val, val_count);
           ^~~~~~
   sound/soc/codecs/cx2072x.c:503:2: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf + 2, val, val_count);
           ^~~~~~
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   sound/soc/codecs/da7213.c:1427:3: warning: Value stored to 'indiv' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   indiv =3D DA7213_PLL_INDIV_9_TO_18_MHZ_VAL;
                   ^
   sound/soc/codecs/da7213.c:1427:3: note: Value stored to 'indiv' is never=
 read
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   sound/soc/codecs/dmic.c:162:4: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(dai_drv, &dmic_dai, sizeof(*dai_drv));
                           ^~~~~~
   sound/soc/codecs/dmic.c:162:4: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                           memcpy(dai_drv, &dmic_dai, sizeof(*dai_drv));
                           ^~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
>> drivers/hwtracing/coresight/coresight-sysfs.c:22:9: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'sprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", csdev->nr_links);
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-sysfs.c:22:9: note: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", csdev->nr_links);
                  ^~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   sound/soc/codecs/sigmadsp-i2c.c:27:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf + 2, data, len);
           ^~~~~~
   sound/soc/codecs/sigmadsp-i2c.c:27:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf + 2, data, len);
           ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/md/dm-dust.c:358:6: warning: Call to function 'sscanf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(argv[1], "%llu%c", &tmp, &dummy) !=3D 1 || tmp !=3D (=
sector_t)tmp) {
               ^~~~~~
   drivers/md/dm-dust.c:358:6: note: Call to function 'sscanf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sscanf_s' in case of C11
           if (sscanf(argv[1], "%llu%c", &tmp, &dummy) !=3D 1 || tmp !=3D (=
sector_t)tmp) {
               ^~~~~~
   drivers/md/dm-dust.c:461:7: warning: Call to function 'sscanf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   if (sscanf(argv[1], "%llu%c", &tmp, &dummy) !=3D 1)
                       ^~~~~~
   drivers/md/dm-dust.c:461:7: note: Call to function 'sscanf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sscanf_s' in case of C11
                   if (sscanf(argv[1], "%llu%c", &tmp, &dummy) !=3D 1)
                       ^~~~~~
   drivers/md/dm-dust.c:481:7: warning: Call to function 'sscanf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   if (sscanf(argv[1], "%llu%c", &tmp, &dummy) !=3D 1)
                       ^~~~~~
   drivers/md/dm-dust.c:481:7: note: Call to function 'sscanf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sscanf_s' in case of C11
                   if (sscanf(argv[1], "%llu%c", &tmp, &dummy) !=3D 1)
                       ^~~~~~
   drivers/md/dm-dust.c:484:7: warning: Call to function 'sscanf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   if (sscanf(argv[2], "%u%c", &tmp_ui, &dummy) !=3D 1)
                       ^~~~~~
   drivers/md/dm-dust.c:484:7: note: Call to function 'sscanf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sscanf_s' in case of C11
                   if (sscanf(argv[2], "%u%c", &tmp_ui, &dummy) !=3D 1)
                       ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   sound/soc/codecs/wm8731.c:106:3: warning: Value stored to 'best' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   best =3D 0;
                   ^      ~
   sound/soc/codecs/wm8731.c:106:3: note: Value stored to 'best' is never r=
ead
                   best =3D 0;
                   ^      ~
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   sound/soc/codecs/wm8741.c:561:4: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&wm8741->pdata, pdata, sizeof(wm8741->pda=
ta));
                           ^~~~~~
   sound/soc/codecs/wm8741.c:561:4: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
                           memcpy(&wm8741->pdata, pdata, sizeof(wm8741->pda=
ta));
                           ^~~~~~
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   sound/soc/codecs/cs42l42.c:605:8: warning: Excessive padding in 'struct =
cs42l42_pll_params' (5 padding bytes, where 1 is optimal). =

   Optimal fields order: =

   sclk, =

   pll_div_frac, =

   mclk_int, =

   mclk_src_sel, =

   sclk_prediv, =

   pll_div_int, =

   pll_mode, =

   pll_divout, =

   pll_cal_ratio, =

   n, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct cs42l42_pll_params {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs42l42.c:605:8: note: Excessive padding in 'struct cs4=
2l42_pll_params' (5 padding bytes, where 1 is optimal). Optimal fields orde=
r: sclk, pll_div_frac, mclk_int, mclk_src_sel, sclk_prediv, pll_div_int, pl=
l_mode, pll_divout, pll_cal_ratio, n, consider reordering the fields or add=
ing explicit padding members
   struct cs42l42_pll_params {

vim +514 drivers/hwtracing/coresight/coresight-cpu-debug.c

2227b7c7463402c Leo Yan 2017-06-05  506  =

2227b7c7463402c Leo Yan 2017-06-05  507  static ssize_t debug_func_knob_rea=
d(struct file *f,
2227b7c7463402c Leo Yan 2017-06-05  508  		char __user *ubuf, size_t count,=
 loff_t *ppos)
2227b7c7463402c Leo Yan 2017-06-05  509  {
2227b7c7463402c Leo Yan 2017-06-05  510  	ssize_t ret;
2227b7c7463402c Leo Yan 2017-06-05  511  	char buf[3];
2227b7c7463402c Leo Yan 2017-06-05  512  =

2227b7c7463402c Leo Yan 2017-06-05  513  	mutex_lock(&debug_lock);
2227b7c7463402c Leo Yan 2017-06-05 @514  	snprintf(buf, sizeof(buf), "%d\n"=
, debug_enable);
2227b7c7463402c Leo Yan 2017-06-05  515  	mutex_unlock(&debug_lock);
2227b7c7463402c Leo Yan 2017-06-05  516  =

2227b7c7463402c Leo Yan 2017-06-05  517  	ret =3D simple_read_from_buffer(u=
buf, count, ppos, buf, sizeof(buf));
2227b7c7463402c Leo Yan 2017-06-05  518  	return ret;
2227b7c7463402c Leo Yan 2017-06-05  519  }
2227b7c7463402c Leo Yan 2017-06-05  520  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0652028736865133657==--

