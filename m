Content-Type: multipart/mixed; boundary="===============8758132091888424229=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iio/potentiometer/ds1803.c:34:8: warning: Excessive padding in 'struct ds1803_cfg' (11 padding bytes, where 3 is optimal).
Date: Mon, 04 Apr 2022 12:33:16 +0800
Message-ID: <202204041258.N3h745lJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8758132091888424229==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jagath Jog J <jagathjog1996@gmail.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Andy Shevchenko <andy.shevchenko@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3123109284176b1532874591f7c81f3837bbdc17
commit: 73c169857c1294ce08ece597278003b795881eb1 iio: potentiometer: ds1803=
: Add support for Maxim DS3502
date:   5 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 5 weeks ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20404/202204041258.N3h745lJ-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b0=
7d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D73c169857c1294ce08ece597278003b795881eb1
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 73c169857c1294ce08ece597278003b795881eb1
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   fs/xfs/libxfs/xfs_attr_leaf.c:2243:29: warning: Value stored to 'drop_le=
af' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct xfs_attr_leafblock *drop_leaf =3D drop_blk->bp->b_addr;
                                      ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_attr_leaf.c:2243:29: note: Value stored to 'drop_leaf'=
 during its initialization is never read
           struct xfs_attr_leafblock *drop_leaf =3D drop_blk->bp->b_addr;
                                      ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_attr_leaf.c:2244:29: warning: Value stored to 'save_le=
af' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct xfs_attr_leafblock *save_leaf =3D save_blk->bp->b_addr;
                                      ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_attr_leaf.c:2244:29: note: Value stored to 'save_leaf'=
 during its initialization is never read
           struct xfs_attr_leafblock *save_leaf =3D save_blk->bp->b_addr;
                                      ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/i2c/busses/i2c-designware-master.c:107:3: warning: Value stored =
to 'fp_str' is never read [clang-analyzer-deadcode.DeadStores]
                   fp_str =3D " Plus";
                   ^        ~~~~~~~
   drivers/i2c/busses/i2c-designware-master.c:107:3: note: Value stored to =
'fp_str' is never read
                   fp_str =3D " Plus";
                   ^        ~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/i2c/busses/i2c-xiic.c:640:6: warning: Value stored to 'fifo_spac=
e' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           int fifo_space =3D xiic_tx_fifo_space(i2c);
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-xiic.c:640:6: note: Value stored to 'fifo_space' =
during its initialization is never read
           int fifo_space =3D xiic_tx_fifo_space(i2c);
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/mmc/core/regulator.c:181:17: warning: Value stored to 'dev' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D mmc_dev(mmc);
                          ^~~
   drivers/mmc/core/regulator.c:181:17: note: Value stored to 'dev' during =
its initialization is never read
           struct device *dev =3D mmc_dev(mmc);
                          ^~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   5 warnings generated.
>> drivers/iio/potentiometer/ds1803.c:34:8: warning: Excessive padding in '=
struct ds1803_cfg' (11 padding bytes, where 3 is optimal). =

   Optimal fields order: =

   channels, =

   read, =

   wipers, =

   kohms, =

   avail, =

   num_channels, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ds1803_cfg {
   ~~~~~~~^~~~~~~~~~~~
   drivers/iio/potentiometer/ds1803.c:34:8: note: Excessive padding in 'str=
uct ds1803_cfg' (11 padding bytes, where 3 is optimal). Optimal fields orde=
r: channels, read, wipers, kohms, avail, num_channels, consider reordering =
the fields or adding explicit padding members
   struct ds1803_cfg {
   ~~~~~~~^~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
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
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/hwmon/dell-smm-hwmon.c:165:6: warning: Value stored to 'ebx' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           int ebx =3D regs->ebx;
               ^~~   ~~~~~~~~~
   drivers/hwmon/dell-smm-hwmon.c:165:6: note: Value stored to 'ebx' during=
 its initialization is never read
           int ebx =3D regs->ebx;
               ^~~   ~~~~~~~~~
   drivers/hwmon/dell-smm-hwmon.c:229:2: warning: Value stored to 'duration=
' is never read [clang-analyzer-deadcode.DeadStores]
           duration =3D ktime_us_delta(ktime_get(), calltime);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/dell-smm-hwmon.c:229:2: note: Value stored to 'duration' i=
s never read
           duration =3D ktime_us_delta(ktime_get(), calltime);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/iio/adc/ti-ads1015.c:414:12: warning: Assigned value is garbage =
or undefined [clang-analyzer-core.uninitialized.Assign]
           scan.chan =3D res;
                     ^ ~~~
   drivers/iio/adc/ti-ads1015.c:401:17: note: 'res' declared without an ini=
tial value
           int chan, ret, res;
                          ^~~
   drivers/iio/adc/ti-ads1015.c:408:8: note: Calling 'ads1015_get_adc_resul=
t'
           ret =3D ads1015_get_adc_result(data, chan, &res);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ti-ads1015.c:350:6: note: 'chan' is >=3D 0
           if (chan < 0 || chan >=3D ADS1015_CHANNELS)
               ^~~~
   drivers/iio/adc/ti-ads1015.c:350:6: note: Left side of '||' is false
   drivers/iio/adc/ti-ads1015.c:350:18: note: Assuming 'chan' is < ADS1015_=
CHANNELS
           if (chan < 0 || chan >=3D ADS1015_CHANNELS)
                           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ti-ads1015.c:350:2: note: Taking false branch
           if (chan < 0 || chan >=3D ADS1015_CHANNELS)
           ^
   drivers/iio/adc/ti-ads1015.c:354:6: note: Assuming 'ret' is not equal to=
 0
           if (ret)
               ^~~
   drivers/iio/adc/ti-ads1015.c:354:2: note: Taking true branch
           if (ret)
           ^
   drivers/iio/adc/ti-ads1015.c:355:3: note: Returning without writing to '=
*val'
                   return ret;
                   ^
   drivers/iio/adc/ti-ads1015.c:408:8: note: Returning from 'ads1015_get_ad=
c_result'
           ret =3D ads1015_get_adc_result(data, chan, &res);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ti-ads1015.c:409:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0) {
               ^~~~~~~
   drivers/iio/adc/ti-ads1015.c:409:2: note: Taking false branch
           if (ret < 0) {
           ^
   drivers/iio/adc/ti-ads1015.c:414:12: note: Assigned value is garbage or =
undefined
           scan.chan =3D res;
                     ^ ~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +34 drivers/iio/potentiometer/ds1803.c

fbbc5e7044f761 Slawomir Stepien 2016-04-10  33  =

fbbc5e7044f761 Slawomir Stepien 2016-04-10 @34  struct ds1803_cfg {
a98d2b029b7c9c Jagath Jog J     2022-02-23  35  	int wipers;
4a68b326112a3a Jagath Jog J     2022-02-23  36  	int avail[3];
fbbc5e7044f761 Slawomir Stepien 2016-04-10  37  	int kohms;
a98d2b029b7c9c Jagath Jog J     2022-02-23  38  	const struct iio_chan_spec=
 *channels;
a98d2b029b7c9c Jagath Jog J     2022-02-23  39  	u8 num_channels;
9b68725e90e44f Jagath Jog J     2022-02-23  40  	int (*read)(struct iio_dev=
 *indio_dev,
9b68725e90e44f Jagath Jog J     2022-02-23  41  		    struct iio_chan_spec =
const *chan, int *val);
fbbc5e7044f761 Slawomir Stepien 2016-04-10  42  };
fbbc5e7044f761 Slawomir Stepien 2016-04-10  43  =


:::::: The code@line 34 was first introduced by commit
:::::: fbbc5e7044f761652e1e83037bd90574976337a3 iio: potentiometer: add dri=
ver for Maxim Integrated DS1803

:::::: TO: Slawomir Stepien <sst@poczta.fm>
:::::: CC: Jonathan Cameron <jic23@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8758132091888424229==--

