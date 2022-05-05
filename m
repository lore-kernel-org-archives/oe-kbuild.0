Content-Type: multipart/mixed; boundary="===============2354185330173004698=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iio/dac/ltc2688.c:84:8: warning: Excessive padding in 'struct ltc2688_state' (83 padding bytes, where 19 is optimal).
Date: Thu, 05 May 2022 11:56:08 +0800
Message-ID: <202205051125.t74wrdnm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2354185330173004698==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Nuno S=C3=A1" <nuno.sa@analog.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a7391ad3572431a354c927cf8896e86e50d7d0bf
commit: 832cb9eeb9312dd2e14133681d3920b773ef1eac iio: dac: add support for =
ltc2688
date:   9 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 9 weeks ago
config: riscv-randconfig-c006-20220427 (https://download.01.org/0day-ci/arc=
hive/20220505/202205051125.t74wrdnm-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcf=
dc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D832cb9eeb9312dd2e14133681d3920b773ef1eac
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 832cb9eeb9312dd2e14133681d3920b773ef1eac
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/at91-sama5d2_adc.c:1556:3: warning: Value stored to 'ret=
' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D at91_adc_read_pressure(st, chan->channel,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/at91-sama5d2_adc.c:1556:3: note: Value stored to 'ret' i=
s never read
                   ret =3D at91_adc_read_pressure(st, chan->channel,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math64.h:42:24: warning: Division by zero [clang-analyzer-=
core.DivideZero]
           *remainder =3D dividend % divisor;
                                 ^
   drivers/iio/adc/at91-sama5d2_adc.c:1343:6: note: Assuming the condition =
is false
           if (iio_trigger_validate_own_device(indio_dev->trig, indio_dev))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/at91-sama5d2_adc.c:1343:2: note: Taking false branch
           if (iio_trigger_validate_own_device(indio_dev->trig, indio_dev))
           ^
   drivers/iio/adc/at91-sama5d2_adc.c:1346:6: note: Assuming field 'dma_cha=
n' is non-null
           if (st->dma_st.dma_chan)
               ^~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/at91-sama5d2_adc.c:1346:2: note: Taking true branch
           if (st->dma_st.dma_chan)
           ^
   drivers/iio/adc/at91-sama5d2_adc.c:1347:3: note: Calling 'at91_adc_trigg=
er_handler_dma'
                   at91_adc_trigger_handler_dma(indio_dev);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/at91-sama5d2_adc.c:1292:15: note: Loop condition is fals=
e.  Exiting loop
           u32 status =3D at91_adc_readl(st, ISR);
                        ^
   drivers/iio/adc/at91-sama5d2_adc.c:387:2: note: expanded from macro 'at9=
1_adc_readl'
           readl_relaxed((st)->base + (st)->soc_info.platform->layout->reg)
           ^
   arch/riscv/include/asm/mmio.h:116:38: note: expanded from macro 'readl_r=
elaxed'
   #define readl_relaxed(c)        ({ u32 __v; __io_rbr(); __v =3D readl_cp=
u(c); __io_rar(); __v; })
                                               ^
   arch/riscv/include/asm/mmio.h:109:21: note: expanded from macro '__io_rb=
r'
   #define __io_rbr()              do {} while (0)
                                   ^
   drivers/iio/adc/at91-sama5d2_adc.c:1292:15: note: Loop condition is fals=
e.  Exiting loop
           u32 status =3D at91_adc_readl(st, ISR);
                        ^
   drivers/iio/adc/at91-sama5d2_adc.c:387:2: note: expanded from macro 'at9=
1_adc_readl'
           readl_relaxed((st)->base + (st)->soc_info.platform->layout->reg)
           ^
   arch/riscv/include/asm/mmio.h:116:70: note: expanded from macro 'readl_r=
elaxed'
   #define readl_relaxed(c)        ({ u32 __v; __io_rbr(); __v =3D readl_cp=
u(c); __io_rar(); __v; })
                                                                           =
    ^
   arch/riscv/include/asm/mmio.h:110:21: note: expanded from macro '__io_ra=
r'
   #define __io_rar()              do {} while (0)
                                   ^
   drivers/iio/adc/at91-sama5d2_adc.c:1294:6: note: Assuming the condition =
is false
           if (status & AT91_SAMA5D2_IER_GOVRE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/at91-sama5d2_adc.c:1294:2: note: Taking false branch
           if (status & AT91_SAMA5D2_IER_GOVRE)
           ^
   drivers/iio/adc/at91-sama5d2_adc.c:1300:17: note: Calling 'div_s64'
           sample_count =3D div_s64(transferred_len, sample_size);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math64.h:141:9: note: Calling 'div_s64_rem'
           return div_s64_rem(dividend, divisor, &remainder);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math64.h:43:2: note: Returning zero
           return dividend / divisor;
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math64.h:141:9: note: Returning from 'div_s64_rem'
           return div_s64_rem(dividend, divisor, &remainder);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math64.h:141:2: note: Returning zero
           return div_s64_rem(dividend, divisor, &remainder);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/at91-sama5d2_adc.c:1300:17: note: Returning from 'div_s6=
4'
           sample_count =3D div_s64(transferred_len, sample_size);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/at91-sama5d2_adc.c:1300:2: note: The value 0 is assigned=
 to 'sample_count'
           sample_count =3D div_s64(transferred_len, sample_size);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/at91-sama5d2_adc.c:1306:47: note: Passing the value 0 vi=
a 2nd parameter 'divisor'
           interval =3D div_s64((ns - st->dma_st.dma_ts), sample_count);
                                                        ^~~~~~~~~~~~
   drivers/iio/adc/at91-sama5d2_adc.c:1306:13: note: Calling 'div_s64'
           interval =3D div_s64((ns - st->dma_st.dma_ts), sample_count);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math64.h:141:31: note: Passing the value 0 via 2nd paramet=
er 'divisor'
           return div_s64_rem(dividend, divisor, &remainder);
                                        ^~~~~~~
   include/linux/math64.h:141:9: note: Calling 'div_s64_rem'
           return div_s64_rem(dividend, divisor, &remainder);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math64.h:42:24: note: Division by zero
           *remainder =3D dividend % divisor;
                        ~~~~~~~~~^~~~~~~~~
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
   5 warnings generated.
>> drivers/iio/dac/ltc2688.c:84:8: warning: Excessive padding in 'struct lt=
c2688_state' (83 padding bytes, where 19 is optimal). =

   Optimal fields order: =

   tx_data, =

   rx_data, =

   vref, =

   spi, =

   regmap, =

   iio_chan, =

   lock, =

   regulators, =

   channels, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ltc2688_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/dac/ltc2688.c:84:8: note: Excessive padding in 'struct ltc26=
88_state' (83 padding bytes, where 19 is optimal). Optimal fields order: tx=
_data, rx_data, vref, spi, regmap, iio_chan, lock, regulators, channels, co=
nsider reordering the fields or adding explicit padding members
   struct ltc2688_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/dac/ltc2688.c:253:11: warning: The left operand of '&' is a =
garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   *code =3D FIELD_GET(LTC2688_DITHER_RAW_MASK, *code);
                           ^
   include/linux/bitfield.h:126:27: note: expanded from macro 'FIELD_GET'
                   (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
                                           ^
   drivers/iio/dac/ltc2688.c:498:2: note: 'val' declared without an initial=
 value
           u32 val;
           ^~~~~~~
   drivers/iio/dac/ltc2688.c:500:6: note: Assuming 'private' is not equal t=
o LTC2688_INPUT_B_AVAIL
           if (private =3D=3D LTC2688_INPUT_B_AVAIL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/dac/ltc2688.c:500:2: note: Taking false branch
           if (private =3D=3D LTC2688_INPUT_B_AVAIL)
           ^
   drivers/iio/dac/ltc2688.c:505:6: note: Assuming 'private' is not equal t=
o LTC2688_DITHER_OFF
           if (private =3D=3D LTC2688_DITHER_OFF)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/dac/ltc2688.c:505:2: note: Taking false branch
           if (private =3D=3D LTC2688_DITHER_OFF)
           ^
   drivers/iio/dac/ltc2688.c:508:8: note: Calling 'ltc2688_dac_code_read'
           ret =3D ltc2688_dac_code_read(st, chan->channel, private, &val);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/dac/ltc2688.c:245:6: note: Assuming 'ret' is not equal to 0
           if (ret)
               ^~~
   drivers/iio/dac/ltc2688.c:245:2: note: Taking true branch
           if (ret)
           ^
   drivers/iio/dac/ltc2688.c:246:3: note: Control jumps to line 250
                   goto out_unlock;
                   ^
   drivers/iio/dac/ltc2688.c:252:6: note: Assuming field 'toggle_chan' is f=
alse
           if (!c->toggle_chan && input =3D=3D LTC2688_INPUT_B)
               ^~~~~~~~~~~~~~~
   drivers/iio/dac/ltc2688.c:252:6: note: Left side of '&&' is true
   drivers/iio/dac/ltc2688.c:252:25: note: Assuming 'input' is equal to LTC=
2688_INPUT_B
           if (!c->toggle_chan && input =3D=3D LTC2688_INPUT_B)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/dac/ltc2688.c:252:2: note: Taking true branch
           if (!c->toggle_chan && input =3D=3D LTC2688_INPUT_B)
           ^
   drivers/iio/dac/ltc2688.c:253:11: note: Taking false branch
                   *code =3D FIELD_GET(LTC2688_DITHER_RAW_MASK, *code);
                           ^
   include/linux/bitfield.h:125:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:62:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/iio/dac/ltc2688.c:253:11: note: Loop condition is false.  Exitin=
g loop
                   *code =3D FIELD_GET(LTC2688_DITHER_RAW_MASK, *code);
                           ^
   include/linux/bitfield.h:125:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:62:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \

vim +84 drivers/iio/dac/ltc2688.c

832cb9eeb9312dd Nuno S=C3=A1 2022-02-25   83  =

832cb9eeb9312dd Nuno S=C3=A1 2022-02-25  @84  struct ltc2688_state {
832cb9eeb9312dd Nuno S=C3=A1 2022-02-25   85  	struct spi_device *spi;
832cb9eeb9312dd Nuno S=C3=A1 2022-02-25   86  	struct regmap *regmap;
832cb9eeb9312dd Nuno S=C3=A1 2022-02-25   87  	struct regulator_bulk_data r=
egulators[2];
832cb9eeb9312dd Nuno S=C3=A1 2022-02-25   88  	struct ltc2688_chan channels=
[LTC2688_DAC_CHANNELS];
832cb9eeb9312dd Nuno S=C3=A1 2022-02-25   89  	struct iio_chan_spec *iio_ch=
an;
832cb9eeb9312dd Nuno S=C3=A1 2022-02-25   90  	/* lock to protect against m=
ultiple access to the device and shared data */
832cb9eeb9312dd Nuno S=C3=A1 2022-02-25   91  	struct mutex lock;
832cb9eeb9312dd Nuno S=C3=A1 2022-02-25   92  	int vref;
832cb9eeb9312dd Nuno S=C3=A1 2022-02-25   93  	/*
832cb9eeb9312dd Nuno S=C3=A1 2022-02-25   94  	 * DMA (thus cache coherency=
 maintenance) requires the
832cb9eeb9312dd Nuno S=C3=A1 2022-02-25   95  	 * transfer buffers to live =
in their own cache lines.
832cb9eeb9312dd Nuno S=C3=A1 2022-02-25   96  	 */
832cb9eeb9312dd Nuno S=C3=A1 2022-02-25   97  	u8 tx_data[6] ____cacheline_=
aligned;
832cb9eeb9312dd Nuno S=C3=A1 2022-02-25   98  	u8 rx_data[3];
832cb9eeb9312dd Nuno S=C3=A1 2022-02-25   99  };
832cb9eeb9312dd Nuno S=C3=A1 2022-02-25  100  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2354185330173004698==--

