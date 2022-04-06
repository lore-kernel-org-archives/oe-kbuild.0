Content-Type: multipart/mixed; boundary="===============2786867212542346969=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iio/adc/ad7280a.c:167:8: warning: Excessive padding in 'struct ad7280_state' (40 padding bytes, where 8 is optimal).
Date: Wed, 06 Apr 2022 13:15:16 +0800
Message-ID: <202204061352.zIQPZ9MR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2786867212542346969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Marcelo Schmitt <marcelo.schmitt1@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3e732ebf7316ac83e8562db7e64cc68aec390a18
commit: cf890fe8ae3641da301ce212a22ea841c9bf6296 iio:adc:ad7280a: Move out =
of staging
date:   6 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 6 weeks ago
config: mips-randconfig-c004-20220404 (https://download.01.org/0day-ci/arch=
ive/20220406/202204061352.zIQPZ9MR-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b0=
7d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dcf890fe8ae3641da301ce212a22ea841c9bf6296
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout cf890fe8ae3641da301ce212a22ea841c9bf6296
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:1748:3: warning: V=
alue stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D disable_component(instance, component);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:1748:3: note: Valu=
e stored to 'ret' is never read
                   ret =3D disable_component(instance, component);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/staging/pi433/pi433_if.c:626:3: warning: Value stored to 'retval=
' is never read [clang-analyzer-deadcode.DeadStores]
                   retval =3D kfifo_out(&device->tx_fifo, &device->buffer[p=
osition],
                   ^
   drivers/staging/pi433/pi433_if.c:626:3: note: Value stored to 'retval' i=
s never read
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/mtd/tests/pagetest.c:214:2: warning: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(writebuf, "There is no data like this!");
           ^~~~~~
   drivers/mtd/tests/pagetest.c:214:2: note: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119
           strcpy(writebuf, "There is no data like this!");
           ^~~~~~
   drivers/mtd/tests/pagetest.c:239:2: warning: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(writebuf, "There is no data like this!");
           ^~~~~~
   drivers/mtd/tests/pagetest.c:239:2: note: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119
           strcpy(writebuf, "There is no data like this!");
           ^~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   10 warnings generated.
   15 warnings generated.
   20 warnings generated.
   25 warnings generated.
   30 warnings generated.
   35 warnings generated.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
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
   Suppressed 5 warnings (5 in non-user code).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   fs/btrfs/free-space-tree.c:1476:3: warning: Value stored to 'total_found=
' is never read [clang-analyzer-deadcode.DeadStores]
                   total_found +=3D add_new_free_space(block_group, extent_=
start,
                   ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/btrfs/free-space-tree.c:1476:3: note: Value stored to 'total_found' i=
s never read
                   total_found +=3D add_new_free_space(block_group, extent_=
start,
                   ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/w1/slaves/w1_ds2438.c:69:3: warning: Value stored to 'crc' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   crc =3D 0;
                   ^     ~
   drivers/w1/slaves/w1_ds2438.c:69:3: note: Value stored to 'crc' is never=
 read
                   crc =3D 0;
                   ^     ~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/iio/adc/ad7280a.c:167:8: warning: Excessive padding in 'struct a=
d7280_state' (40 padding bytes, where 8 is optimal). =

   Optimal fields order: =

   tx, =

   spi, =

   channels, =

   chain_last_alert_ignore, =

   slave_num, =

   scan_cnt, =

   readback_delay_us, =

   rx, =

   lock, =

   thermistor_term_en, =

   oversampling_ratio, =

   acquisition_time, =

   ctrl_lb, =

   cell_threshhigh, =

   cell_threshlow, =

   aux_threshhigh, =

   aux_threshlow, =

   cb_mask, =

   crc_tab, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad7280_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/adc/ad7280a.c:167:8: note: Excessive padding in 'struct ad72=
80_state' (40 padding bytes, where 8 is optimal). Optimal fields order: tx,=
 spi, channels, chain_last_alert_ignore, slave_num, scan_cnt, readback_dela=
y_us, rx, lock, thermistor_term_en, oversampling_ratio, acquisition_time, c=
trl_lb, cell_threshhigh, cell_threshlow, aux_threshhigh, aux_threshlow, cb_=
mask, crc_tab, consider reordering the fields or adding explicit padding me=
mbers
   struct ad7280_state {
   ~~~~~~~^~~~~~~~~~~~~~
>> drivers/iio/adc/ad7280a.c:768:3: warning: Value stored to 'value' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   value =3D clamp(value, 0L, 0xFFL);
                   ^
   drivers/iio/adc/ad7280a.c:768:3: note: Value stored to 'value' is never =
read
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/iio/adc/ad7292.c:78:8: warning: Excessive padding in 'struct ad7=
292_state' (50 padding bytes, where 18 is optimal). =

   Optimal fields order: =

   d16, =

   vref_mv, =

   spi, =

   reg, =

   d8, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad7292_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/adc/ad7292.c:78:8: note: Excessive padding in 'struct ad7292=
_state' (50 padding bytes, where 18 is optimal). Optimal fields order: d16,=
 vref_mv, spi, reg, d8, consider reordering the fields or adding explicit p=
adding members
   struct ad7292_state {
   ~~~~~~~^~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/spi/spi-butterfly.c:194:3: warning: Value stored to 'status' is =
never read [clang-analyzer-deadcode.DeadStores]
                   status =3D -ENOMEM;
                   ^        ~~~~~~~
   drivers/spi/spi-butterfly.c:194:3: note: Value stored to 'status' is nev=
er read
                   status =3D -ENOMEM;
                   ^        ~~~~~~~
   drivers/spi/spi-butterfly.c:220:3: warning: Value stored to 'status' is =
never read [clang-analyzer-deadcode.DeadStores]
                   status =3D -ENOMEM;
                   ^        ~~~~~~~
   drivers/spi/spi-butterfly.c:220:3: note: Value stored to 'status' is nev=
er read
                   status =3D -ENOMEM;
                   ^        ~~~~~~~
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
   6 warnings generated.
   drivers/spi/spi-lantiq-ssc.c:284:17: warning: Division by zero [clang-an=
alyzer-core.DivideZero]
                   brt =3D spi_clk / max_speed_hz - 1;
                                 ^
   drivers/spi/spi-lantiq-ssc.c:816:2: note: Calling 'hw_setup_transfer'
           hw_setup_transfer(spi, spidev, t);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-lantiq-ssc.c:433:2: note: 'speed_hz' initialized here
           unsigned int speed_hz =3D t->speed_hz;
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-lantiq-ssc.c:437:6: note: Assuming 'bits_per_word' is no=
t equal to field 'bits_per_word'
           if (bits_per_word !=3D spi->bits_per_word ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-lantiq-ssc.c:437:42: note: Left side of '||' is true
           if (bits_per_word !=3D spi->bits_per_word ||
                                                   ^
   drivers/spi/spi-lantiq-ssc.c:440:26: note: Passing value via 2nd paramet=
er 'max_speed_hz'
                   hw_setup_speed_hz(spi, speed_hz);
                                          ^~~~~~~~
   drivers/spi/spi-lantiq-ssc.c:440:3: note: Calling 'hw_setup_speed_hz'
                   hw_setup_speed_hz(spi, speed_hz);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-lantiq-ssc.c:281:6: note: Assuming 'max_speed_hz' is <=
=3D 'spi_clk'
           if (max_speed_hz > spi_clk)
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-lantiq-ssc.c:281:2: note: Taking false branch
           if (max_speed_hz > spi_clk)
           ^
   drivers/spi/spi-lantiq-ssc.c:284:17: note: Division by zero
                   brt =3D spi_clk / max_speed_hz - 1;
                         ~~~~~~~~^~~~~~~~~~~~~~
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   sound/soc/xtensa/xtfpga-i2s.c:285:11: warning: Value stored to 'channels=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           unsigned channels =3D params_channels(params);
                    ^~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~

vim +167 drivers/iio/adc/ad7280a.c

2051f25d2a2657 drivers/staging/iio/adc/ad7280a.c Michael Hennerich  2011-07=
-20  166  =

2051f25d2a2657 drivers/staging/iio/adc/ad7280a.c Michael Hennerich  2011-07=
-20 @167  struct ad7280_state {
2051f25d2a2657 drivers/staging/iio/adc/ad7280a.c Michael Hennerich  2011-07=
-20  168  	struct spi_device		*spi;
2051f25d2a2657 drivers/staging/iio/adc/ad7280a.c Michael Hennerich  2011-07=
-20  169  	struct iio_chan_spec		*channels;
219def44752738 drivers/staging/iio/adc/ad7280a.c Jonathan Cameron   2022-02=
-06  170  	unsigned int			chain_last_alert_ignore;
219def44752738 drivers/staging/iio/adc/ad7280a.c Jonathan Cameron   2022-02=
-06  171  	bool				thermistor_term_en;
2051f25d2a2657 drivers/staging/iio/adc/ad7280a.c Michael Hennerich  2011-07=
-20  172  	int				slave_num;
2051f25d2a2657 drivers/staging/iio/adc/ad7280a.c Michael Hennerich  2011-07=
-20  173  	int				scan_cnt;
2051f25d2a2657 drivers/staging/iio/adc/ad7280a.c Michael Hennerich  2011-07=
-20  174  	int				readback_delay_us;
4cd62a5425115a drivers/staging/iio/adc/ad7280a.c Slawomir Stepien   2018-10=
-18  175  	unsigned char			crc_tab[CRC8_TABLE_SIZE];
c5fe2f537b91e1 drivers/staging/iio/adc/ad7280a.c Jonathan Cameron   2022-02=
-06  176  	u8				oversampling_ratio;
c5fe2f537b91e1 drivers/staging/iio/adc/ad7280a.c Jonathan Cameron   2022-02=
-06  177  	u8				acquisition_time;
2051f25d2a2657 drivers/staging/iio/adc/ad7280a.c Michael Hennerich  2011-07=
-20  178  	unsigned char			ctrl_lb;
2051f25d2a2657 drivers/staging/iio/adc/ad7280a.c Michael Hennerich  2011-07=
-20  179  	unsigned char			cell_threshhigh;
2051f25d2a2657 drivers/staging/iio/adc/ad7280a.c Michael Hennerich  2011-07=
-20  180  	unsigned char			cell_threshlow;
2051f25d2a2657 drivers/staging/iio/adc/ad7280a.c Michael Hennerich  2011-07=
-20  181  	unsigned char			aux_threshhigh;
2051f25d2a2657 drivers/staging/iio/adc/ad7280a.c Michael Hennerich  2011-07=
-20  182  	unsigned char			aux_threshlow;
2051f25d2a2657 drivers/staging/iio/adc/ad7280a.c Michael Hennerich  2011-07=
-20  183  	unsigned char			cb_mask[AD7280A_MAX_CHAIN];
dba968c4fea0f9 drivers/staging/iio/adc/ad7280a.c Gargi Sharma       2017-03=
-17  184  	struct mutex			lock; /* protect sensor state */
93dbad639d9330 drivers/staging/iio/adc/ad7280a.c Lars-Peter Clausen 2013-11=
-25  185  =

003f1d48de5204 drivers/staging/iio/adc/ad7280a.c Jonathan Cameron   2022-02=
-06  186  	__be32				tx ____cacheline_aligned;
003f1d48de5204 drivers/staging/iio/adc/ad7280a.c Jonathan Cameron   2022-02=
-06  187  	__be32				rx;
2051f25d2a2657 drivers/staging/iio/adc/ad7280a.c Michael Hennerich  2011-07=
-20  188  };
2051f25d2a2657 drivers/staging/iio/adc/ad7280a.c Michael Hennerich  2011-07=
-20  189  =


:::::: The code at line 167 was first introduced by commit
:::::: 2051f25d2a26573918b59d69847f5bf77635023e iio: adc: New driver for AD=
7280A Lithium Ion Battery Monitoring System

:::::: TO: Michael Hennerich <michael.hennerich@analog.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2786867212542346969==--

