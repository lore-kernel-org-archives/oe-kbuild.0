Content-Type: multipart/mixed; boundary="===============2406872769662301807=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:469:2: warning: Value stored to 'cif_id' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 09 Nov 2021 07:11:12 +0800
Message-ID: <202111090702.psjVCpZf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2406872769662301807==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

Hi Mauro,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e851dfae4371d3c751f1e18e8eb5eba993de1467
commit: 67e061f044e46c9823e59ca7981786f858bfa292 Merge tag 'v5.10-rc6' into=
 patchwork
date:   11 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 11 months ago
config: riscv-randconfig-c006-20210929 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dc6e8d=
fdfe7efecfda318d43a06fae18b40eb498)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D67e061f044e46c9823e59ca7981786f858bfa292
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 67e061f044e46c9823e59ca7981786f858bfa292
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   6 warnings generated.
   drivers/iio/frequency/ad9523.c:266:8: warning: Excessive padding in 'str=
uct ad9523_state' (86 padding bytes, where 22 is optimal). =

   Optimal fields order: =

   data, =

   spi, =

   reg, =

   pdata, =

   pwrdown_gpio, =

   reset_gpio, =

   sync_gpio, =

   vcxo_freq, =

   vco_freq, =

   vco_out_freq, =

   lock, =

   ad9523_channels, =

   vco_out_map, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad9523_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/frequency/ad9523.c:266:8: note: Excessive padding in 'struct=
 ad9523_state' (86 padding bytes, where 22 is optimal). Optimal fields orde=
r: data, spi, reg, pdata, pwrdown_gpio, reset_gpio, sync_gpio, vcxo_freq, v=
co_freq, vco_out_freq, lock, ad9523_channels, vco_out_map, consider reorder=
ing the fields or adding explicit padding members
   struct ad9523_state {
   ~~~~~~~^~~~~~~~~~~~~~
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
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
   8 warnings generated.
   drivers/mailbox/bcm-pdc-mailbox.c:523:17: warning: Value stored to 'dev'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct device *dev =3D &pdcs->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/mailbox/bcm-pdc-mailbox.c:523:17: note: Value stored to 'dev' du=
ring its initialization is never read
           struct device *dev =3D &pdcs->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/mailbox/bcm-pdc-mailbox.c:551:17: warning: Value stored to 'dev'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct device *dev =3D &pdcs->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/mailbox/bcm-pdc-mailbox.c:551:17: note: Value stored to 'dev' du=
ring its initialization is never read
           struct device *dev =3D &pdcs->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/mailbox/bcm-pdc-mailbox.c:989:17: warning: Value stored to 'dev'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct device *dev =3D &pdcs->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/mailbox/bcm-pdc-mailbox.c:989:17: note: Value stored to 'dev' du=
ring its initialization is never read
           struct device *dev =3D &pdcs->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/mailbox/bcm-pdc-mailbox.c:1287:2: warning: Value stored to 'dev'=
 is never read [clang-analyzer-deadcode.DeadStores]
           dev =3D &pdev->dev;
           ^     ~~~~~~~~~~
   drivers/mailbox/bcm-pdc-mailbox.c:1287:2: note: Value stored to 'dev' is=
 never read
           dev =3D &pdev->dev;
           ^     ~~~~~~~~~~
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
   7 warnings generated.
>> drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:469:2: warning: Valu=
e stored to 'cif_id' is never read [clang-analyzer-deadcode.DeadStores]
           cif_id =3D rkisp1_read(rkisp1, RKISP1_CIF_VI_ID);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:469:2: note: Value s=
tored to 'cif_id' is never read
           cif_id =3D rkisp1_read(rkisp1, RKISP1_CIF_VI_ID);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:851:24: warning: Val=
ue stored to 'rkisp1' during its initialization is never read [clang-analyz=
er-deadcode.DeadStores]
           struct rkisp1_device *rkisp1 =3D
                                 ^~~~~~
   drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:851:24: note: Value =
stored to 'rkisp1' during its initialization is never read
           struct rkisp1_device *rkisp1 =3D
                                 ^~~~~~
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
   drivers/media/usb/tm6000/tm6000-video.c:920:2: warning: Value stored to =
'field' is never read [clang-analyzer-deadcode.DeadStores]
           field =3D f->fmt.pix.field;
           ^       ~~~~~~~~~~~~~~~~
   drivers/media/usb/tm6000/tm6000-video.c:920:2: note: Value stored to 'fi=
eld' is never read
           field =3D f->fmt.pix.field;
           ^       ~~~~~~~~~~~~~~~~
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
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/iio/imu/fxos8700_core.c:167:8: warning: Excessive padding in 'st=
ruct fxos8700_data' (114 padding bytes, where 50 is optimal). =

   Optimal fields order: =

   buf, =

   regmap, =

   trig, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct fxos8700_data {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/imu/fxos8700_core.c:167:8: note: Excessive padding in 'struc=
t fxos8700_data' (114 padding bytes, where 50 is optimal). Optimal fields o=
rder: buf, regmap, trig, consider reordering the fields or adding explicit =
padding members
   struct fxos8700_data {
   ~~~~~~~^~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
   drivers/iio/dac/ad5504.c:50:8: warning: Excessive padding in 'struct ad5=
504_state' (106 padding bytes, where 42 is optimal). =

   Optimal fields order: =

   data, =

   spi, =

   reg, =

   pwr_down_mask, =

   pwr_down_mode, =

   vref_mv, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
--
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/s5c73m3/s5c73m3-core.c:678:2: note: Value stored to 'r=
et' is never read
           ret =3D s5c73m3_write(state, 0x30100120, 0x0820);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/s5c73m3/s5c73m3-core.c:679:2: warning: Value stored to=
 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D s5c73m3_write(state, 0x30100124, 0x0820);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/s5c73m3/s5c73m3-core.c:679:2: note: Value stored to 'r=
et' is never read
           ret =3D s5c73m3_write(state, 0x30100124, 0x0820);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/s5c73m3/s5c73m3-core.c:682:2: warning: Value stored to=
 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D s5c73m3_write(state, 0x00010418, 0x0008);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/s5c73m3/s5c73m3-core.c:682:2: note: Value stored to 'r=
et' is never read
           ret =3D s5c73m3_write(state, 0x00010418, 0x0008);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/s5c73m3/s5c73m3-core.c:1478:2: warning: Value stored t=
o 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D media_create_pad_link(&state->sensor_sd.entity,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/s5c73m3/s5c73m3-core.c:1478:2: note: Value stored to '=
ret' is never read
           ret =3D media_create_pad_link(&state->sensor_sd.entity,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   7 warnings generated.
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:118:11: warning: V=
alue stored to 'period' during its initialization is never read [clang-anal=
yzer-deadcode.DeadStores]
           uint32_t period =3D ts->period;
                    ^~~~~~   ~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:118:11: note: Valu=
e stored to 'period' during its initialization is never read
           uint32_t period =3D ts->period;
                    ^~~~~~   ~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/iio/imu/inv_mpu6050/inv_mpu_core.c:707:4: warning: Value stored =
to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D inv_mpu6050_sensor_show(st, st->reg->gyr=
o_offset,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/iio/imu/inv_mpu6050/inv_mpu_core.c:707:4: note: Value stored to =
'ret' is never read
                           ret =3D inv_mpu6050_sensor_show(st, st->reg->gyr=
o_offset,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/iio/imu/inv_mpu6050/inv_mpu_core.c:713:4: warning: Value stored =
to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D inv_mpu6050_sensor_show(st, st->reg->acc=
l_offset,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/iio/imu/inv_mpu6050/inv_mpu_core.c:713:4: note: Value stored to =
'ret' is never read
                           ret =3D inv_mpu6050_sensor_show(st, st->reg->acc=
l_offset,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/siox/siox-core.c:240:4: warning: Value stored to 'status' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                           status &=3D ~SIOX_STATUS_WDG;
                           ^         ~~~~~~~~~~~~~~~~
   drivers/siox/siox-core.c:240:4: note: Value stored to 'status' is never =
read
                           status &=3D ~SIOX_STATUS_WDG;
                           ^         ~~~~~~~~~~~~~~~~
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
   6 warnings generated.
   drivers/gnss/sirf.c:191:17: warning: Value stored to 'dev' during its in=
itialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &data->serdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/gnss/sirf.c:191:17: note: Value stored to 'dev' during its initi=
alization is never read
           struct device *dev =3D &data->serdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:469:2: warning: Valu=
e stored to 'cif_id' is never read [clang-analyzer-deadcode.DeadStores]
           cif_id =3D rkisp1_read(rkisp1, RKISP1_CIF_VI_ID);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:469:2: note: Value s=
tored to 'cif_id' is never read
           cif_id =3D rkisp1_read(rkisp1, RKISP1_CIF_VI_ID);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:851:24: warning: Val=
ue stored to 'rkisp1' during its initialization is never read [clang-analyz=
er-deadcode.DeadStores]
           struct rkisp1_device *rkisp1 =3D
                                 ^~~~~~
   drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:851:24: note: Value =
stored to 'rkisp1' during its initialization is never read
           struct rkisp1_device *rkisp1 =3D
                                 ^~~~~~
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/iio/adc/ti-adc084s021.c:23:8: warning: Excessive padding in 'str=
uct adc084s021' (98 padding bytes, where 34 is optimal). =

   Optimal fields order: =

   tx_buf, =

   scan, =

   spi, =

   reg, =

   message, =

   lock, =

   spi_trans, =

   rx_buf, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct adc084s021 {
   ~~~~~~~^~~~~~~~~~~~
   drivers/iio/adc/ti-adc084s021.c:23:8: note: Excessive padding in 'struct=
 adc084s021' (98 padding bytes, where 34 is optimal). Optimal fields order:=
 tx_buf, scan, spi, reg, message, lock, spi_trans, rx_buf, consider reorder=
ing the fields or adding explicit padding members
   struct adc084s021 {
   ~~~~~~~^~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/iio/adc/ti-adc128s052.c:26:8: warning: Excessive padding in 'str=
uct adc128' (90 padding bytes, where 26 is optimal). =

   Optimal fields order: =

   buffer, =

   spi, =

   reg, =

   lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct adc128 {
   ~~~~~~~^~~~~~~~
   drivers/iio/adc/ti-adc128s052.c:26:8: note: Excessive padding in 'struct=
 adc128' (90 padding bytes, where 26 is optimal). Optimal fields order: buf=
fer, spi, reg, lock, consider reordering the fields or adding explicit padd=
ing members
   struct adc128 {
   ~~~~~~~^~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/iio/adc/ti-adc161s626.c:66:8: warning: Excessive padding in 'str=
uct ti_adc_data' (98 padding bytes, where 34 is optimal). =

   Optimal fields order: =

   buffer, =

   indio_dev, =

   spi, =

   ref, =

   read_size, =

   shift, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ti_adc_data {
   ~~~~~~~^~~~~~~~~~~~~
   drivers/iio/adc/ti-adc161s626.c:66:8: note: Excessive padding in 'struct=
 ti_adc_data' (98 padding bytes, where 34 is optimal). Optimal fields order=
: buffer, indio_dev, spi, ref, read_size, shift, consider reordering the fi=
elds or adding explicit padding members
   struct ti_adc_data {
   ~~~~~~~^~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/iio/temperature/maxim_thermocouple.c:122:8: warning: Excessive p=
adding in 'struct maxim_thermocouple_data' (103 padding bytes, where 39 is =
optimal). =

   Optimal fields order: =

   buffer, =

   spi, =

   chip, =

   tc_type, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct maxim_thermocouple_data {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/temperature/maxim_thermocouple.c:122:8: note: Excessive padd=
ing in 'struct maxim_thermocouple_data' (103 padding bytes, where 39 is opt=
imal). Optimal fields order: buffer, spi, chip, tc_type, consider reorderin=
g the fields or adding explicit padding members
   struct maxim_thermocouple_data {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
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

vim +/cif_id +469 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c

d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c Helen Koike 2020-0=
1-08  462  =

d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c Helen Koike 2020-0=
1-08  463  /* Hardware configure Entry */
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c Helen Koike 2020-0=
1-08  464  static int rkisp1_config_cif(struct rkisp1_device *rkisp1)
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c Helen Koike 2020-0=
1-08  465  {
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c Helen Koike 2020-0=
1-08  466  	u32 cif_id;
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c Helen Koike 2020-0=
1-08  467  	int ret;
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c Helen Koike 2020-0=
1-08  468  =

d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c Helen Koike 2020-0=
1-08 @469  	cif_id =3D rkisp1_read(rkisp1, RKISP1_CIF_VI_ID);
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c Helen Koike 2020-0=
1-08  470  	dev_dbg(rkisp1->dev, "CIF_ID 0x%08x\n", cif_id);
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c Helen Koike 2020-0=
1-08  471  =

d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c Helen Koike 2020-0=
1-08  472  	ret =3D rkisp1_config_isp(rkisp1);
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c Helen Koike 2020-0=
1-08  473  	if (ret)
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c Helen Koike 2020-0=
1-08  474  		return ret;
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c Helen Koike 2020-0=
1-08  475  	ret =3D rkisp1_config_path(rkisp1);
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c Helen Koike 2020-0=
1-08  476  	if (ret)
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c Helen Koike 2020-0=
1-08  477  		return ret;
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c Helen Koike 2020-0=
1-08  478  	rkisp1_config_ism(rkisp1);
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c Helen Koike 2020-0=
1-08  479  =

d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c Helen Koike 2020-0=
1-08  480  	return 0;
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c Helen Koike 2020-0=
1-08  481  }
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c Helen Koike 2020-0=
1-08  482  =


:::::: The code at line 469 was first introduced by commit
:::::: d65dd85281fbf7fc66a936b0aa8979614a7ba150 media: staging: rkisp1: add=
 Rockchip ISP1 base driver

:::::: TO: Helen Koike <helen.koike@collabora.com>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2406872769662301807==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
vEhlX5hA9b0b7j8tC40gAfYBAA==
--===============2406872769662301807==--

