Content-Type: multipart/mixed; boundary="===============7090547011701126174=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iio/frequency/admv1014.c:119:8: warning: Excessive padding in 'struct admv1014_state' (88 padding bytes, where 24 is optimal).
Date: Wed, 04 May 2022 17:14:12 +0800
Message-ID: <202205041724.3Mcr23Sq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7090547011701126174==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Antoniu Miclaus <antoniu.miclaus@analog.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   107c948d1d3e61d10aee9d0f7c3d81bbee9842af
commit: f4eb9ac7842ff22370e262b8440edada40b1680a iio: frequency: admv1014: =
add support for ADMV1014
date:   2 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 2 months ago
config: riscv-randconfig-c006-20220427 (https://download.01.org/0day-ci/arc=
hive/20220504/202205041724.3Mcr23Sq-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcf=
dc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df4eb9ac7842ff22370e262b8440edada40b1680a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f4eb9ac7842ff22370e262b8440edada40b1680a
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/iio/adc/bcm_iproc_adc.c:120:17: warning: Value stored to 'dev' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &indio_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   drivers/iio/adc/bcm_iproc_adc.c:120:17: note: Value stored to 'dev' duri=
ng its initialization is never read
           struct device *dev =3D &indio_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~
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
   4 warnings generated.
   drivers/iio/adc/hi8435.c:43:8: warning: Excessive padding in 'struct hi8=
435_priv' (65 padding bytes, where 1 is optimal). =

   Optimal fields order: =

   reg_buffer, =

   event_prev_val, =

   spi, =

   event_scan_mask, =

   lock, =

   threshold_lo, =

   threshold_hi, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct hi8435_priv {
   ~~~~~~~^~~~~~~~~~~~~
   drivers/iio/adc/hi8435.c:43:8: note: Excessive padding in 'struct hi8435=
_priv' (65 padding bytes, where 1 is optimal). Optimal fields order: reg_bu=
ffer, event_prev_val, spi, event_scan_mask, lock, threshold_lo, threshold_h=
i, consider reordering the fields or adding explicit padding members
   struct hi8435_priv {
   ~~~~~~~^~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/iio/adc/hx711.c:536:2: warning: Value stored to 'ret' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           ret =3D of_property_read_u32(np, "clock-frequency",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/hx711.c:536:2: note: Value stored to 'ret' is never read
           ret =3D of_property_read_u32(np, "clock-frequency",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/iio/frequency/adf4371.c:157:8: warning: Excessive padding in 'st=
ruct adf4371_state' (86 padding bytes, where 22 is optimal). =

   Optimal fields order: =

   buf, =

   integer, =

   spi, =

   regmap, =

   clkin, =

   chip_info, =

   clkin_freq, =

   fpfd, =

   lock, =

   fract1, =

   fract2, =

   mod2, =

   rf_div_sel, =

   ref_div_factor, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct adf4371_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/frequency/adf4371.c:157:8: note: Excessive padding in 'struc=
t adf4371_state' (86 padding bytes, where 22 is optimal). Optimal fields or=
der: buf, integer, spi, regmap, clkin, chip_info, clkin_freq, fpfd, lock, f=
ract1, fract2, mod2, rf_div_sel, ref_div_factor, consider reordering the fi=
elds or adding explicit padding members
   struct adf4371_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/iio/frequency/admv1013.c:93:8: warning: Excessive padding in 'st=
ruct admv1013_state' (108 padding bytes, where 44 is optimal). =

   Optimal fields order: =

   data, =

   det_en, =

   input_mode, =

   spi, =

   clkin, =

   reg, =

   lock, =

   nb, =

   quad_se_mode, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct admv1013_state {
   ~~~~~~~^~~~~~~~~~~~~~~~
   drivers/iio/frequency/admv1013.c:93:8: note: Excessive padding in 'struc=
t admv1013_state' (108 padding bytes, where 44 is optimal). Optimal fields =
order: data, det_en, input_mode, spi, clkin, reg, lock, nb, quad_se_mode, c=
onsider reordering the fields or adding explicit padding members
   struct admv1013_state {
   ~~~~~~~^~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/iio/frequency/admv1014.c:119:8: warning: Excessive padding in 's=
truct admv1014_state' (88 padding bytes, where 24 is optimal). =

   Optimal fields order: =

   data, =

   det_en, =

   input_mode, =

   spi, =

   clkin, =

   nb, =

   lock, =

   regulators, =

   quad_se_mode, =

   p1db_comp, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct admv1014_state {
   ~~~~~~~^~~~~~~~~~~~~~~~
   drivers/iio/frequency/admv1014.c:119:8: note: Excessive padding in 'stru=
ct admv1014_state' (88 padding bytes, where 24 is optimal). Optimal fields =
order: data, det_en, input_mode, spi, clkin, nb, lock, regulators, quad_se_=
mode, p1db_comp, consider reordering the fields or adding explicit padding =
members
   struct admv1014_state {
   ~~~~~~~^~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   3 warnings generated.
   drivers/iio/accel/adxl313_core.c:46:8: warning: Excessive padding in 'st=
ruct adxl313_data' (94 padding bytes, where 30 is optimal). =

   Optimal fields order: =

   transf_buf, =

   regmap, =

   lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct adxl313_data {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/accel/adxl313_core.c:46:8: note: Excessive padding in 'struc=
t adxl313_data' (94 padding bytes, where 30 is optimal). Optimal fields ord=
er: transf_buf, regmap, lock, consider reordering the fields or adding expl=
icit padding members
   struct adxl313_data {
   ~~~~~~~^~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   4 warnings generated.
   drivers/iio/temperature/maxim_thermocouple.c:121:8: warning: Excessive p=
adding in 'struct maxim_thermocouple_data' (95 padding bytes, where 31 is o=
ptimal). =

   Optimal fields order: =

   buffer, =

   spi, =

   chip, =

   tc_type, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct maxim_thermocouple_data {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~

vim +119 drivers/iio/frequency/admv1014.c

f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  118  =

f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15 @119  struct admv1014_state {
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  120  	struct spi_device		*spi;
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  121  	struct clk			*clkin;
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  122  	struct notifier_block		nb;
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  123  	/* Protect against concurr=
ent accesses to the device and to data*/
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  124  	struct mutex			lock;
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  125  	struct regulator_bulk_data=
	regulators[ADMV1014_NUM_REGULATORS];
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  126  	unsigned int			input_mode;
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  127  	unsigned int			quad_se_mod=
e;
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  128  	unsigned int			p1db_comp;
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  129  	bool				det_en;
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  130  	u8				data[3] ____cachelin=
e_aligned;
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  131  };
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  132  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7090547011701126174==--

