Content-Type: multipart/mixed; boundary="===============2021119864258379460=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH V4 5/5] iio: accel: sca3300: Add inclination channels
Date: Sat, 14 May 2022 08:30:28 +0800
Message-ID: <202205140818.lC2k2Nn3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2021119864258379460==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220509064928.2352796-6-Qing-wu.Li@leica-geosystems.com.cn>
References: <20220509064928.2352796-6-Qing-wu.Li@leica-geosystems.com.cn>
TO: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
TO: jic23(a)kernel.org
TO: lars(a)metafoo.de
TO: robh+dt(a)kernel.org
TO: tomas.melin(a)vaisala.com
TO: andy.shevchenko(a)gmail.com
TO: devicetree(a)vger.kernel.org
TO: linux-kernel(a)vger.kernel.org
TO: Qing-wu.Li(a)leica-geosystems.com.cn
CC: linux-iio(a)vger.kernel.org

Hi LI,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on v5.18-rc6 next-20220513]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/LI-Qingwu/dt-binding=
s-iio-accel-sca3300-Document-murata-scl3300/20220509-155015
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-c002-20220512 (https://download.01.org/0day-ci/archi=
ve/20220514/202205140818.lC2k2Nn3-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd12=
3c56754edf62c7042dcf23185c3727610f)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/a2bd278e34465f96af3=
32198c259202635deb5fd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review LI-Qingwu/dt-bindings-iio-accel-sc=
a3300-Document-murata-scl3300/20220509-155015
        git checkout a2bd278e34465f96af332198c259202635deb5fd
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/iio/light/adux1020.c:374:3: note: Control jumps to 'case IIO_PRO=
XIMITY:'  at line 375
                   switch (chan->type) {
                   ^
   drivers/iio/light/adux1020.c:377:8: note: 'ret' is >=3D 0
                           if (ret < 0)
                               ^~~
   drivers/iio/light/adux1020.c:377:4: note: Taking false branch
                           if (ret < 0)
                           ^
   drivers/iio/light/adux1020.c:380:10: note: Calling 'adux1020_measure'
                           ret =3D adux1020_measure(data, ADUX1020_MODE_PRO=
X_I, buf);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/iio/light/adux1020.c:320:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/iio/light/adux1020.c:320:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/light/adux1020.c:327:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/iio/light/adux1020.c:327:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/light/adux1020.c:330:2: note: Loop condition is true.  Enter=
ing loop body
           while (tries--) {
           ^
   drivers/iio/light/adux1020.c:333:7: note: Assuming 'ret' is >=3D 0
                   if (ret < 0)
                       ^~~~~~~
   drivers/iio/light/adux1020.c:333:3: note: Taking false branch
                   if (ret < 0)
                   ^
   drivers/iio/light/adux1020.c:337:7: note: Assuming 'status' is >=3D fiel=
d 'bytes'
                   if (status >=3D adux1020_modes[mode].bytes)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/adux1020.c:337:3: note: Taking true branch
                   if (status >=3D adux1020_modes[mode].bytes)
                   ^
   drivers/iio/light/adux1020.c:338:4: note:  Execution continues on line 3=
42
                           break;
                           ^
   drivers/iio/light/adux1020.c:342:6: note: 'tries' is >=3D 0
           if (tries < 0)
               ^~~~~
   drivers/iio/light/adux1020.c:342:2: note: Taking false branch
           if (tries < 0)
           ^
   drivers/iio/light/adux1020.c:345:8: note: Calling 'adux1020_read_fifo'
           ret =3D adux1020_read_fifo(data, val, adux1020_modes[mode].buf_l=
en);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/adux1020.c:260:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/iio/light/adux1020.c:260:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/light/adux1020.c:263:14: note: Assuming 'i' is >=3D 'buf_len'
           for (i =3D 0; i < buf_len; i++) {
                       ^~~~~~~~~~~
   drivers/iio/light/adux1020.c:263:2: note: Loop condition is false. Execu=
tion continues on line 273
           for (i =3D 0; i < buf_len; i++) {
           ^
   drivers/iio/light/adux1020.c:273:2: note: Returning without writing to '=
*buf'
           return regmap_write(data->regmap, ADUX1020_REG_TEST_MODES_3,
           ^
   drivers/iio/light/adux1020.c:345:8: note: Returning from 'adux1020_read_=
fifo'
           ret =3D adux1020_read_fifo(data, val, adux1020_modes[mode].buf_l=
en);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/adux1020.c:346:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/iio/light/adux1020.c:346:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/light/adux1020.c:352:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/iio/light/adux1020.c:352:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/light/adux1020.c:356:2: note: Returning without writing to '=
*val'
           return regmap_update_bits(data->regmap, ADUX1020_REG_INT_MASK,
           ^
   drivers/iio/light/adux1020.c:380:10: note: Returning from 'adux1020_meas=
ure'
                           ret =3D adux1020_measure(data, ADUX1020_MODE_PRO=
X_I, buf);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/iio/light/adux1020.c:381:8: note: Assuming 'ret' is >=3D 0
                           if (ret < 0)
                               ^~~~~~~
   drivers/iio/light/adux1020.c:381:4: note: Taking false branch
                           if (ret < 0)
                           ^
   drivers/iio/light/adux1020.c:384:9: note: Assigned value is garbage or u=
ndefined
                           *val =3D buf[0];
                                ^ ~~~~~~
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
>> drivers/iio/accel/sca3300.c:163:8: warning: Excessive padding in 'struct=
 sca3300_chip_info' (17 padding bytes, where 1 is optimal). =

   Optimal fields order: =

   channels, =

   scan_masks, =

   accel_scale, =

   accel_scale_map, =

   incli_scale, =

   incli_scale_map, =

   freq_table, =

   freq_map, =

   avail_modes_table, =

   name, =

   num_channels, =

   num_accel_scales, =

   num_incli_scales, =

   num_freqs, =

   num_avail_modes, =

   chip_id, =

   angle, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct sca3300_chip_info {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/sca3300.c:163:8: note: Excessive padding in 'struct sc=
a3300_chip_info' (17 padding bytes, where 1 is optimal). Optimal fields ord=
er: channels, scan_masks, accel_scale, accel_scale_map, incli_scale, incli_=
scale_map, freq_table, freq_map, avail_modes_table, name, num_channels, num=
_accel_scales, num_incli_scales, num_freqs, num_avail_modes, chip_id, angle=
, consider reordering the fields or adding explicit padding members
   struct sca3300_chip_info {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/sca3300.c:191:8: warning: Excessive padding in 'struct=
 sca3300_data' (48 padding bytes, where 16 is optimal). =

   Optimal fields order: =

   txbuf, =

   spi, =

   scan, =

   chip, =

   lock, =

   rxbuf, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct sca3300_data {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/accel/sca3300.c:191:8: note: Excessive padding in 'struct sc=
a3300_data' (48 padding bytes, where 16 is optimal). Optimal fields order: =
txbuf, spi, scan, chip, lock, rxbuf, consider reordering the fields or addi=
ng explicit padding members
   struct sca3300_data {
   ~~~~~~~^~~~~~~~~~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (49 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (22 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/iio/adc/ad_sigma_delta.c:197:2: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf, 0xff, size);
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
   drivers/iio/adc/ad_sigma_delta.c:197:2: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
           memset(buf, 0xff, size);
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
   drivers/iio/adc/ad_sigma_delta.c:493:23: warning: Array subscript is und=
efined [clang-analyzer-core.uninitialized.ArraySubscript]
                   converted_channel =3D data[status_pos] & sigma_delta->in=
fo->status_ch_mask;
                                       ^    ~~~~~~~~~~
   drivers/iio/adc/ad_sigma_delta.c:441:2: note: 'status_pos' declared with=
out an initial value
           unsigned int status_pos;
           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ad_sigma_delta.c:449:6: note: Assuming field 'data_reg' =
is equal to 0
           if (sigma_delta->info->data_reg !=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ad_sigma_delta.c:449:2: note: Taking false branch
           if (sigma_delta->info->data_reg !=3D 0)
           ^
   drivers/iio/adc/ad_sigma_delta.c:455:6: note: Assuming field 'status_app=
ended' is true
           if (sigma_delta->status_appended)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ad_sigma_delta.c:455:2: note: Taking true branch
           if (sigma_delta->status_appended)
           ^
   drivers/iio/adc/ad_sigma_delta.c:460:2: note: 'Default' branch taken. Ex=
ecution continues on line 485
           switch (reg_size) {
           ^
   drivers/iio/adc/ad_sigma_delta.c:485:6: note: Assuming field 'active_slo=
ts' is not equal to 1
           if (sigma_delta->active_slots =3D=3D 1) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ad_sigma_delta.c:485:2: note: Taking false branch
           if (sigma_delta->active_slots =3D=3D 1) {
           ^
   drivers/iio/adc/ad_sigma_delta.c:490:19: note: Field 'status_appended' i=
s true
           if (sigma_delta->status_appended) {

vim +163 drivers/iio/accel/sca3300.c

a2bd278e34465f LI Qingwu 2022-05-09  162  =

5495295d0dc190 LI Qingwu 2022-05-09 @163  struct sca3300_chip_info {
5495295d0dc190 LI Qingwu 2022-05-09  164  	const struct iio_chan_spec *chan=
nels;
5495295d0dc190 LI Qingwu 2022-05-09  165  	u8 num_channels;
5495295d0dc190 LI Qingwu 2022-05-09  166  	const unsigned long *scan_masks;
5495295d0dc190 LI Qingwu 2022-05-09  167  	const int (*accel_scale)[2];
5495295d0dc190 LI Qingwu 2022-05-09  168  	const int *accel_scale_map;
5495295d0dc190 LI Qingwu 2022-05-09  169  	u8 num_accel_scales;
a2bd278e34465f LI Qingwu 2022-05-09  170  	const int (*incli_scale)[2];
a2bd278e34465f LI Qingwu 2022-05-09  171  	const int *incli_scale_map;
a2bd278e34465f LI Qingwu 2022-05-09  172  	u8 num_incli_scales;
5495295d0dc190 LI Qingwu 2022-05-09  173  	const int *freq_table;
5495295d0dc190 LI Qingwu 2022-05-09  174  	const int *freq_map;
5495295d0dc190 LI Qingwu 2022-05-09  175  	u8 num_freqs;
5495295d0dc190 LI Qingwu 2022-05-09  176  	const int *avail_modes_table;
5495295d0dc190 LI Qingwu 2022-05-09  177  	u8 num_avail_modes;
5495295d0dc190 LI Qingwu 2022-05-09  178  	const char *name;
5495295d0dc190 LI Qingwu 2022-05-09  179  	u8 chip_id;
a2bd278e34465f LI Qingwu 2022-05-09  180  	bool angle;
5495295d0dc190 LI Qingwu 2022-05-09  181  };
5495295d0dc190 LI Qingwu 2022-05-09  182  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2021119864258379460==--

