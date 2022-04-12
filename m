Content-Type: multipart/mixed; boundary="===============8281669980182567632=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 4/9] iio: accel: bma400: Add triggered buffer support
Date: Tue, 12 Apr 2022 16:27:27 +0800
Message-ID: <202204121617.YJhBD8uR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8281669980182567632==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220411203133.19929-5-jagathjog1996@gmail.com>
References: <20220411203133.19929-5-jagathjog1996@gmail.com>
TO: Jagath Jog J <jagathjog1996@gmail.com>
TO: dan(a)dlrobertson.com
TO: jic23(a)kernel.org
TO: andy.shevchenko(a)gmail.com
CC: linux-iio(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi Jagath,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on v5.18-rc2 next-20220411]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jagath-Jog-J/iio-acc=
el-bma400-Add-buffer-step-and-activity-inactivity/20220412-043436
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: arm-randconfig-c002-20220411 (https://download.01.org/0day-ci/archi=
ve/20220412/202204121617.YJhBD8uR-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fe2478=
d44e4f7f191c43fef629ac7a23d0251e72)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/6882789b10dba397445=
c4d97986430a20d536fbd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jagath-Jog-J/iio-accel-bma400-Add-=
buffer-step-and-activity-inactivity/20220412-043436
        git checkout 6882789b10dba397445c4d97986430a20d536fbd
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/hwmon/pmbus/max20730.c:730:3: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
                   memset(data->vout_voltage_divider, 0, sizeof(data->vout_=
voltage_divider));
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
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
   drivers/regulator/virtual.c:112:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->min_uV);
                  ^~~~~~~
   drivers/regulator/virtual.c:112:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->min_uV);
                  ^~~~~~~
   drivers/regulator/virtual.c:138:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->max_uV);
                  ^~~~~~~
   drivers/regulator/virtual.c:138:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->max_uV);
                  ^~~~~~~
   drivers/regulator/virtual.c:164:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->min_uA);
                  ^~~~~~~
   drivers/regulator/virtual.c:164:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->min_uA);
                  ^~~~~~~
   drivers/regulator/virtual.c:190:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->max_uA);
                  ^~~~~~~
   drivers/regulator/virtual.c:190:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->max_uA);
                  ^~~~~~~
   drivers/regulator/virtual.c:219:10: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "fast\n");
                          ^~~~~~~
   drivers/regulator/virtual.c:219:10: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "fast\n");
                          ^~~~~~~
   drivers/regulator/virtual.c:221:10: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "normal\n");
                          ^~~~~~~
   drivers/regulator/virtual.c:221:10: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "normal\n");
                          ^~~~~~~
   drivers/regulator/virtual.c:223:10: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "idle\n");
                          ^~~~~~~
   drivers/regulator/virtual.c:223:10: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "idle\n");
                          ^~~~~~~
   drivers/regulator/virtual.c:225:10: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "standby\n");
                          ^~~~~~~
   drivers/regulator/virtual.c:225:10: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "standby\n");
                          ^~~~~~~
   drivers/regulator/virtual.c:227:10: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "unknown\n");
                          ^~~~~~~
   drivers/regulator/virtual.c:227:10: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "unknown\n");
                          ^~~~~~~
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/iio/accel/bma220_spi.c:62:8: warning: Excessive padding in 'stru=
ct bma220_data' (34 padding bytes, where 2 is optimal). =

   Optimal fields order: =

   tx_buf, =

   spi_device, =

   scan, =

   lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct bma220_data {
   ~~~~~~~^~~~~~~~~~~~~
   drivers/iio/accel/bma220_spi.c:62:8: note: Excessive padding in 'struct =
bma220_data' (34 padding bytes, where 2 is optimal). Optimal fields order: =
tx_buf, spi_device, scan, lock, consider reordering the fields or adding ex=
plicit padding members
   struct bma220_data {
   ~~~~~~~^~~~~~~~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
>> drivers/iio/accel/bma400_core.c:59:8: warning: Excessive padding in 'str=
uct bma400_data' (44 padding bytes, where 12 is optimal). =

   Optimal fields order: =

   buffer, =

   dev, =

   regmap, =

   power_mode, =

   oversampling_ratio, =

   scale, =

   trig, =

   sample_freq, =

   regulators, =

   orientation, =

   mutex, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct bma400_data {
   ~~~~~~~^~~~~~~~~~~~~
   drivers/iio/accel/bma400_core.c:59:8: note: Excessive padding in 'struct=
 bma400_data' (44 padding bytes, where 12 is optimal). Optimal fields order=
: buffer, dev, regmap, power_mode, oversampling_ratio, scale, trig, sample_=
freq, regulators, orientation, mutex, consider reordering the fields or add=
ing explicit padding members
   struct bma400_data {
   ~~~~~~~^~~~~~~~~~~~~
   drivers/iio/accel/bma400_core.c:269:31: warning: The result of the right=
 shift is undefined because the right operand is negative [clang-analyzer-c=
ore.UndefinedBinaryOperatorResult]
           *val =3D BMA400_ACC_ODR_MAX_HZ >> (BMA400_ACC_ODR_MAX_RAW - raw);
                                        ^
   drivers/iio/accel/bma400_core.c:793:2: note: Control jumps to 'case IIO_=
CHAN_INFO_SAMP_FREQ:'  at line 794
           switch (mask) {
           ^
   drivers/iio/accel/bma400_core.c:799:7: note: Assuming field 'type' is eq=
ual to IIO_ACCEL
                   if (chan->type !=3D IIO_ACCEL)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/bma400_core.c:799:3: note: Taking false branch
                   if (chan->type !=3D IIO_ACCEL)
                   ^
   drivers/iio/accel/bma400_core.c:803:9: note: Calling 'bma400_set_accel_o=
utput_data_rate'
                   ret =3D bma400_set_accel_output_data_rate(data, val, val=
2);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/bma400_core.c:333:6: note: Assuming 'hz' is >=3D BMA40=
0_ACC_ODR_MIN_WHOLE_HZ
           if (hz >=3D BMA400_ACC_ODR_MIN_WHOLE_HZ) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/bma400_core.c:333:2: note: Taking true branch
           if (hz >=3D BMA400_ACC_ODR_MIN_WHOLE_HZ) {
           ^
   drivers/iio/accel/bma400_core.c:334:7: note: Assuming 'uhz' is 0
                   if (uhz || hz > BMA400_ACC_ODR_MAX_HZ)
                       ^~~
   drivers/iio/accel/bma400_core.c:334:7: note: Left side of '||' is false
   drivers/iio/accel/bma400_core.c:334:14: note: Assuming 'hz' is <=3D BMA4=
00_ACC_ODR_MAX_HZ
                   if (uhz || hz > BMA400_ACC_ODR_MAX_HZ)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/bma400_core.c:334:3: note: Taking false branch
                   if (uhz || hz > BMA400_ACC_ODR_MAX_HZ)
                   ^
   drivers/iio/accel/bma400_core.c:340:7: note: Assuming the condition is f=
alse
                   if (hz >> idx !=3D BMA400_ACC_ODR_MIN_WHOLE_HZ)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/bma400_core.c:340:3: note: Taking false branch
                   if (hz >> idx !=3D BMA400_ACC_ODR_MIN_WHOLE_HZ)
                   ^
   drivers/iio/accel/bma400_core.c:351:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/iio/accel/bma400_core.c:351:2: note: Taking false branch
           if (ret)
           ^
   drivers/iio/accel/bma400_core.c:358:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/iio/accel/bma400_core.c:358:2: note: Taking false branch
           if (ret)
           ^
   drivers/iio/accel/bma400_core.c:361:2: note: Calling 'bma400_output_data=
_rate_from_raw'
           bma400_output_data_rate_from_raw(idx, &data->sample_freq.hz,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/bma400_core.c:269:31: note: The result of the right sh=
ift is undefined because the right operand is negative
           *val =3D BMA400_ACC_ODR_MAX_HZ >> (BMA400_ACC_ODR_MAX_RAW - raw);
                                        ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   kernel/cgroup/cgroup-v1.c:1103:3: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(root->release_agent_path, ctx->release_agent);
                   ^~~~~~
   kernel/cgroup/cgroup-v1.c:1103:3: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
                   strcpy(root->release_agent_path, ctx->release_agent);
                   ^~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.

vim +59 drivers/iio/accel/bma400_core.c

465c811f1f201a Dan Robertson 2019-12-20  58  =

465c811f1f201a Dan Robertson 2019-12-20 @59  struct bma400_data {
465c811f1f201a Dan Robertson 2019-12-20  60  	struct device *dev;
465c811f1f201a Dan Robertson 2019-12-20  61  	struct regmap *regmap;
3cf7ded15e4046 Dan Robertson 2019-12-20  62  	struct regulator_bulk_data re=
gulators[BMA400_NUM_REGULATORS];
465c811f1f201a Dan Robertson 2019-12-20  63  	struct mutex mutex; /* data r=
egister lock */
465c811f1f201a Dan Robertson 2019-12-20  64  	struct iio_mount_matrix orien=
tation;
465c811f1f201a Dan Robertson 2019-12-20  65  	enum bma400_power_mode power_=
mode;
465c811f1f201a Dan Robertson 2019-12-20  66  	struct bma400_sample_freq sam=
ple_freq;
465c811f1f201a Dan Robertson 2019-12-20  67  	int oversampling_ratio;
465c811f1f201a Dan Robertson 2019-12-20  68  	int scale;
6882789b10dba3 Jagath Jog J  2022-04-12  69  	struct iio_trigger *trig;
6882789b10dba3 Jagath Jog J  2022-04-12  70  	/* Correct time stamp alignme=
nt */
6882789b10dba3 Jagath Jog J  2022-04-12  71  	struct {
6882789b10dba3 Jagath Jog J  2022-04-12  72  		__le16 buff[3];
6882789b10dba3 Jagath Jog J  2022-04-12  73  		u8 temperature;
6882789b10dba3 Jagath Jog J  2022-04-12  74  		s64 ts __aligned(8);
6882789b10dba3 Jagath Jog J  2022-04-12  75  	} buffer ____cacheline_aligne=
d;
465c811f1f201a Dan Robertson 2019-12-20  76  };
465c811f1f201a Dan Robertson 2019-12-20  77  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8281669980182567632==--

