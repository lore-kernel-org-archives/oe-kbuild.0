Content-Type: multipart/mixed; boundary="===============2018744507331177769=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 848/1029] drivers/iio/adc/ad7887.c:59:8: warning: Excessive padding in 'struct ad7887_state' (84 padding bytes, where 20 is optimal).
Date: Sun, 27 Mar 2022 16:37:57 +0800
Message-ID: <202203271633.rDIe0vrP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2018744507331177769==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   1870e0fa79a9d58c6748c34550f3ccea0b515933
commit: ad3ea50420b2f1742f84afbb0de7dd0b355298c2 [848/1029] spi: spi-zynqmp=
-gqspi: Add dual parallel and stacked mode support in driver
:::::: branch date: 3 days ago
:::::: commit date: 8 weeks ago
config: riscv-randconfig-c006-20220327 (https://download.01.org/0day-ci/arc=
hive/20220327/202203271633.rDIe0vrP-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/Xilinx/linux-xlnx/commit/ad3ea50420b2f1742f84a=
fbb0de7dd0b355298c2
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout ad3ea50420b2f1742f84afbb0de7dd0b355298c2
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/hwtracing/intel_th/core.c:1022:32: note: Loop condition is false=
.  Exiting loop
           struct intel_th_device *hub =3D to_intel_th_device(thdev->dev.pa=
rent);
                                         ^
   drivers/hwtracing/intel_th/intel_th.h:93:2: note: expanded from macro 't=
o_intel_th_device'
           container_of((_d), struct intel_th_device, dev)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/hwtracing/intel_th/core.c:1022:2: note: 'hub' initialized to a n=
ull pointer value
           struct intel_th_device *hub =3D to_intel_th_device(thdev->dev.pa=
rent);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/intel_th/core.c:1023:35: note: Dereference of null poi=
nter
           struct intel_th_driver *hubdrv =3D to_intel_th_driver(hub->dev.d=
river);
                                            ^
   drivers/hwtracing/intel_th/intel_th.h:192:2: note: expanded from macro '=
to_intel_th_driver'
           container_of((_d), struct intel_th_driver, driver)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:494:25: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   drivers/hwtracing/intel_th/core.c:1040:26: warning: Value stored to 'hub=
drv' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct intel_th_driver *hubdrv =3D to_intel_th_driver(hub->dev.d=
river);
                                   ^~~~~~
   drivers/hwtracing/intel_th/core.c:1040:26: note: Value stored to 'hubdrv=
' during its initialization is never read
           struct intel_th_driver *hubdrv =3D to_intel_th_driver(hub->dev.d=
river);
                                   ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/iio/adc/ad7766.c:35:8: warning: Excessive padding in 'struct ad7=
766' (88 padding bytes, where 24 is optimal). =

   Optimal fields order: =

   data, =

   chip_info, =

   spi, =

   mclk, =

   pd_gpio, =

   trig, =

   reg, =

   msg, =

   xfer, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad7766 {
   ~~~~~~~^~~~~~~~
   drivers/iio/adc/ad7766.c:35:8: note: Excessive padding in 'struct ad7766=
' (88 padding bytes, where 24 is optimal). Optimal fields order: data, chip=
_info, spi, mclk, pd_gpio, trig, reg, msg, xfer, consider reordering the fi=
elds or adding explicit padding members
   struct ad7766 {
   ~~~~~~~^~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/iio/adc/ad7768-1.c:154:8: warning: Excessive padding in 'struct =
ad7768_state' (64 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   data, =

   spi, =

   vref, =

   mclk, =

   mclk_freq, =

   samp_freq, =

   trig, =

   gpio_sync_in, =

   labels, =

   completion, =

   lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad7768_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/adc/ad7768-1.c:154:8: note: Excessive padding in 'struct ad7=
768_state' (64 padding bytes, where 0 is optimal). Optimal fields order: da=
ta, spi, vref, mclk, mclk_freq, samp_freq, trig, gpio_sync_in, labels, comp=
letion, lock, consider reordering the fields or adding explicit padding mem=
bers
   struct ad7768_state {
   ~~~~~~~^~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/iio/adc/ad7887.c:59:8: warning: Excessive padding in 'struct ad7=
887_state' (84 padding bytes, where 20 is optimal). =

   Optimal fields order: =

   data, =

   spi, =

   chip_info, =

   reg, =

   ring_msg, =

   msg, =

   xfer, =

   tx_cmd_buf, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad7887_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/adc/ad7887.c:59:8: note: Excessive padding in 'struct ad7887=
_state' (84 padding bytes, where 20 is optimal). Optimal fields order: data=
, spi, chip_info, reg, ring_msg, msg, xfer, tx_cmd_buf, consider reordering=
 the fields or adding explicit padding members
   struct ad7887_state {
   ~~~~~~~^~~~~~~~~~~~~~
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
   4 warnings generated.
   drivers/memory/tegra/tegra210-emc-core.c:936:2: warning: Value stored to=
 'mpc_req' is never read [clang-analyzer-deadcode.DeadStores]
           mpc_req =3D emc_readl(emc, EMC_MPC);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-core.c:936:2: note: Value stored to 'm=
pc_req' is never read
           mpc_req =3D emc_readl(emc, EMC_MPC);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-core.c:1897:7: warning: Dereference of=
 null pointer [clang-analyzer-core.NullDereference]
                   if (emc->timings[i].rate =3D=3D current_rate) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-core.c:1833:6: note: Assuming 'emc' is=
 non-null
           if (!emc)
               ^~~~
   drivers/memory/tegra/tegra210-emc-core.c:1833:2: note: Taking false bran=
ch
           if (!emc)
           ^
   drivers/memory/tegra/tegra210-emc-core.c:1837:6: note: Calling 'IS_ERR'
           if (IS_ERR(emc->clk))
               ^~~~~~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-core.c:1837:6: note: Returning from 'I=
S_ERR'
           if (IS_ERR(emc->clk))
               ^~~~~~~~~~~~~~~~
   drivers/memory/tegra/tegra210-emc-core.c:1837:2: note: Taking false bran=
ch
           if (IS_ERR(emc->clk))
           ^
   drivers/memory/tegra/tegra210-emc-core.c:1840:2: note: Calling 'platform=
_set_drvdata'
           platform_set_drvdata(pdev, emc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_device.h:243:2: note: Calling 'dev_set_drvdata'
           dev_set_drvdata(&pdev->dev, data);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:692:1: note: Returning without writing to 'data->=
nominal', which participates in a condition later
   }
   ^
   include/linux/device.h:692:1: note: Returning without writing to 'data->=
derated', which participates in a condition later
   include/linux/device.h:692:1: note: Returning without writing to 'data->=
nominal'
   include/linux/device.h:692:1: note: Returning without writing to 'data->=
timings'
   include/linux/platform_device.h:243:2: note: Returning from 'dev_set_drv=
data'
           dev_set_drvdata(&pdev->dev, data);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_device.h:244:1: note: Returning without writing t=
o 'data->nominal', which participates in a condition later
   }
   ^
   include/linux/platform_device.h:244:1: note: Returning without writing t=
o 'data->derated', which participates in a condition later

vim +59 drivers/iio/adc/ad7887.c

65dd3d3d7a9bca6 drivers/staging/iio/adc/ad7887.c Lars-Peter Clausen 2012-11=
-05  58  =

65dd3d3d7a9bca6 drivers/staging/iio/adc/ad7887.c Lars-Peter Clausen 2012-11=
-05 @59  struct ad7887_state {
65dd3d3d7a9bca6 drivers/staging/iio/adc/ad7887.c Lars-Peter Clausen 2012-11=
-05  60  	struct spi_device		*spi;
65dd3d3d7a9bca6 drivers/staging/iio/adc/ad7887.c Lars-Peter Clausen 2012-11=
-05  61  	const struct ad7887_chip_info	*chip_info;
65dd3d3d7a9bca6 drivers/staging/iio/adc/ad7887.c Lars-Peter Clausen 2012-11=
-05  62  	struct regulator		*reg;
65dd3d3d7a9bca6 drivers/staging/iio/adc/ad7887.c Lars-Peter Clausen 2012-11=
-05  63  	struct spi_transfer		xfer[4];
65dd3d3d7a9bca6 drivers/staging/iio/adc/ad7887.c Lars-Peter Clausen 2012-11=
-05  64  	struct spi_message		msg[3];
65dd3d3d7a9bca6 drivers/staging/iio/adc/ad7887.c Lars-Peter Clausen 2012-11=
-05  65  	struct spi_message		*ring_msg;
fce7c3eac7d4ca7 drivers/staging/iio/adc/ad7887.c Lars-Peter Clausen 2012-11=
-05  66  	unsigned char			tx_cmd_buf[4];
65dd3d3d7a9bca6 drivers/staging/iio/adc/ad7887.c Lars-Peter Clausen 2012-11=
-05  67  =

65dd3d3d7a9bca6 drivers/staging/iio/adc/ad7887.c Lars-Peter Clausen 2012-11=
-05  68  	/*
65dd3d3d7a9bca6 drivers/staging/iio/adc/ad7887.c Lars-Peter Clausen 2012-11=
-05  69  	 * DMA (thus cache coherency maintenance) requires the
65dd3d3d7a9bca6 drivers/staging/iio/adc/ad7887.c Lars-Peter Clausen 2012-11=
-05  70  	 * transfer buffers to live in their own cache lines.
65dd3d3d7a9bca6 drivers/staging/iio/adc/ad7887.c Lars-Peter Clausen 2012-11=
-05  71  	 * Buffer needs to be large enough to hold two 16 bit samples and=
 a
65dd3d3d7a9bca6 drivers/staging/iio/adc/ad7887.c Lars-Peter Clausen 2012-11=
-05  72  	 * 64 bit aligned 64 bit timestamp.
65dd3d3d7a9bca6 drivers/staging/iio/adc/ad7887.c Lars-Peter Clausen 2012-11=
-05  73  	 */
65dd3d3d7a9bca6 drivers/staging/iio/adc/ad7887.c Lars-Peter Clausen 2012-11=
-05  74  	unsigned char data[ALIGN(4, sizeof(s64)) + sizeof(s64)]
65dd3d3d7a9bca6 drivers/staging/iio/adc/ad7887.c Lars-Peter Clausen 2012-11=
-05  75  		____cacheline_aligned;
65dd3d3d7a9bca6 drivers/staging/iio/adc/ad7887.c Lars-Peter Clausen 2012-11=
-05  76  };
65dd3d3d7a9bca6 drivers/staging/iio/adc/ad7887.c Lars-Peter Clausen 2012-11=
-05  77  =


:::::: The code at line 59 was first introduced by commit
:::::: 65dd3d3d7a9bca683599b214229c546392394622 staging:iio:ad7887: Squash =
everything into one file

:::::: TO: Lars-Peter Clausen <lars@metafoo.de>
:::::: CC: Jonathan Cameron <jic23@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2018744507331177769==--

