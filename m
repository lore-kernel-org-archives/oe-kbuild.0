Content-Type: multipart/mixed; boundary="===============0626426367431804899=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jic23-iio:testing 56/102] drivers/iio/addac/ad74413r.c:912:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Sun, 19 Dec 2021 05:30:57 +0800
Message-ID: <202112190554.XhH7b2RM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0626426367431804899==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Cosmin Tanislav <demonsingur@gmail.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testi=
ng
head:   3e4ec89acfc665ea0c4dea103275acaf391fc019
commit: fea251b6a5dbdf8ba8af64abcd013d66ab6b05ee [56/102] iio: addac: add A=
D74413R driver
:::::: branch date: 11 hours ago
:::::: commit date: 6 days ago
config: riscv-randconfig-c006-20211214 (https://download.01.org/0day-ci/arc=
hive/20211219/202112190554.XhH7b2RM-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2dd=
b6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/com=
mit/?id=3Dfea251b6a5dbdf8ba8af64abcd013d66ab6b05ee
        git remote add jic23-iio https://git.kernel.org/pub/scm/linux/kerne=
l/git/jic23/iio.git
        git fetch --no-tags jic23-iio testing
        git checkout fea251b6a5dbdf8ba8af64abcd013d66ab6b05ee
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   3 warnings generated.
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
   6 warnings generated.
   drivers/hwtracing/intel_th/core.c:390:2: warning: Call to function 'strc=
py' is insecure as it does not provide bounding of the memory buffer. Repla=
ce unbounded copy functions with analogous functions that support length ar=
guments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.str=
cpy]
           strcpy(thdev->name, name);
           ^~~~~~
   drivers/hwtracing/intel_th/core.c:390:2: note: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119
           strcpy(thdev->name, name);
           ^~~~~~
   drivers/hwtracing/intel_th/core.c:1023:35: warning: Dereference of null =
pointer [clang-analyzer-core.NullDereference]
           struct intel_th_driver *hubdrv =3D to_intel_th_driver(hub->dev.d=
river);
                                            ^
   drivers/hwtracing/intel_th/intel_th.h:192:2: note: expanded from macro '=
to_intel_th_driver'
           container_of((_d), struct intel_th_driver, driver)
           ^
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^
   drivers/hwtracing/intel_th/core.c:313:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/hwtracing/intel_th/core.c:313:2: note: Taking false branch
           if (ret)
           ^
   drivers/hwtracing/intel_th/core.c:316:7: note: Assuming 'val' is 0
           if (!!val !=3D thdev->output.active) {
                ^~~~
   drivers/hwtracing/intel_th/core.c:316:6: note: Assuming the condition is=
 true
           if (!!val !=3D thdev->output.active) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/intel_th/core.c:316:2: note: Taking true branch
           if (!!val !=3D thdev->output.active) {
           ^
   drivers/hwtracing/intel_th/core.c:317:7: note: 'val' is 0
                   if (val)
                       ^~~
   drivers/hwtracing/intel_th/core.c:317:3: note: Taking false branch
                   if (val)
                   ^
   drivers/hwtracing/intel_th/core.c:320:4: note: Calling 'intel_th_output_=
deactivate'
                           intel_th_output_deactivate(thdev);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/intel_th/core.c:279:3: note: Assuming field 'driver' i=
s non-null
                   to_intel_th_driver_or_null(thdev->dev.driver);
                   ^
   drivers/hwtracing/intel_th/intel_th.h:195:3: note: expanded from macro '=
to_intel_th_driver_or_null'
           ((_d) ? to_intel_th_driver(_d) : NULL)
            ^~~~
   drivers/hwtracing/intel_th/core.c:279:3: note: '?' condition is true
                   to_intel_th_driver_or_null(thdev->dev.driver);
                   ^
   drivers/hwtracing/intel_th/intel_th.h:195:3: note: expanded from macro '=
to_intel_th_driver_or_null'
           ((_d) ? to_intel_th_driver(_d) : NULL)
            ^
   drivers/hwtracing/intel_th/core.c:282:7: note: 'thdrv' is non-null
           if (!thdrv)
                ^~~~~
   drivers/hwtracing/intel_th/core.c:282:2: note: Taking false branch
           if (!thdrv)
           ^
   drivers/hwtracing/intel_th/core.c:285:6: note: Assuming field 'deactivat=
e' is null
           if (thdrv->deactivate)
               ^~~~~~~~~~~~~~~~~
   drivers/hwtracing/intel_th/core.c:285:2: note: Taking false branch
           if (thdrv->deactivate)
           ^
   drivers/hwtracing/intel_th/core.c:288:3: note: Calling 'intel_th_trace_d=
isable'
                   intel_th_trace_disable(thdev);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
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
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/iio/addac/ad74413r.c:912:2: warning: Undefined or garbage value =
returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^      ~~~
   drivers/iio/addac/ad74413r.c:846:2: note: 'ret' declared without an init=
ial value
           int ret;
           ^~~~~~~
   drivers/iio/addac/ad74413r.c:853:2: note: Assuming 'channel' is >=3D 4
           for_each_clear_bit(channel, active_scan_mask, AD74413R_CHANNEL_M=
AX) {
           ^
   include/linux/bitops.h:48:7: note: expanded from macro 'for_each_clear_b=
it'
                (bit) < (size);                                    \
                ^~~~~~~~~~~~~~
   drivers/iio/addac/ad74413r.c:853:2: note: Loop condition is false. Execu=
tion continues on line 859
           for_each_clear_bit(channel, active_scan_mask, AD74413R_CHANNEL_M=
AX) {
           ^
   include/linux/bitops.h:47:2: note: expanded from macro 'for_each_clear_b=
it'
           for ((bit) =3D find_first_zero_bit((addr), (size));       \
           ^
   drivers/iio/addac/ad74413r.c:859:6: note: Assuming the condition is true
           if (*active_scan_mask =3D=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/addac/ad74413r.c:859:2: note: Taking true branch
           if (*active_scan_mask =3D=3D 0)
           ^
   drivers/iio/addac/ad74413r.c:860:3: note: Control jumps to line 910
                   goto out;
                   ^
   drivers/iio/addac/ad74413r.c:912:2: note: Undefined or garbage value ret=
urned to caller
           return ret;
           ^      ~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   include/linux/log2.h:57:13: warning: The result of the left shift is und=
efined due to shifting by '64', which is greater or equal to the width of t=
ype 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);
                      ^
   drivers/iio/buffer/kfifo_buf.c:48:6: note: Assuming field 'update_needed=
' is not equal to 0
           if (buf->update_needed) {
               ^~~~~~~~~~~~~~~~~~
   drivers/iio/buffer/kfifo_buf.c:48:2: note: Taking true branch
           if (buf->update_needed) {
           ^
   drivers/iio/buffer/kfifo_buf.c:49:3: note: Taking true branch
                   kfifo_free(&buf->kf);
                   ^
   include/linux/kfifo.h:369:2: note: expanded from macro 'kfifo_free'
           if (__is_kfifo_ptr(__tmp)) \
           ^
   drivers/iio/buffer/kfifo_buf.c:50:9: note: Calling '__iio_allocate_kfifo'
                   ret =3D __iio_allocate_kfifo(buf, buf->buffer.bytes_per_=
datum,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/iio/buffer/kfifo_buf.c:28:7: note: Assuming 'length' is not equa=
l to 0
           if ((length =3D=3D 0) || (bytes_per_datum =3D=3D 0))
                ^~~~~~~~~~~
   drivers/iio/buffer/kfifo_buf.c:28:6: note: Left side of '||' is false
           if ((length =3D=3D 0) || (bytes_per_datum =3D=3D 0))
               ^
   drivers/iio/buffer/kfifo_buf.c:28:24: note: Assuming 'bytes_per_datum' i=
s not equal to 0
           if ((length =3D=3D 0) || (bytes_per_datum =3D=3D 0))
                                 ^~~~~~~~~~~~~~~~~~~~
   drivers/iio/buffer/kfifo_buf.c:28:2: note: Taking false branch
           if ((length =3D=3D 0) || (bytes_per_datum =3D=3D 0))
           ^
   drivers/iio/buffer/kfifo_buf.c:35:6: note: '?' condition is false
           if (roundup_pow_of_two(length) > UINT_MAX / bytes_per_datum)
               ^
   include/linux/log2.h:176:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __builtin_constant_p(n) ? (             \
           ^
   drivers/iio/buffer/kfifo_buf.c:35:6: note: Calling '__roundup_pow_of_two'
           if (roundup_pow_of_two(length) > UINT_MAX / bytes_per_datum)
               ^
   include/linux/log2.h:180:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __roundup_pow_of_two(n)                 \
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Calling 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/bitops.h:188:2: note: Taking false branch
           if (sizeof(l) =3D=3D 4)
           ^
   include/linux/bitops.h:190:9: note: Calling 'fls64'
           return fls64(l);
                  ^~~~~~~~
   include/asm-generic/bitops/fls64.h:29:6: note: Assuming 'x' is not equal=
 to 0
           if (x =3D=3D 0)

vim +912 drivers/iio/addac/ad74413r.c

fea251b6a5dbdf Cosmin Tanislav 2021-12-05  837  =

fea251b6a5dbdf Cosmin Tanislav 2021-12-05  838  static int ad74413r_update_=
scan_mode(struct iio_dev *indio_dev,
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  839  				     const unsigned lon=
g *active_scan_mask)
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  840  {
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  841  	struct ad74413r_state *st =
=3D iio_priv(indio_dev);
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  842  	struct spi_transfer *xfer =
=3D st->adc_samples_xfer;
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  843  	u8 *rx_buf =3D &st->adc_sa=
mples_buf.rx_buf[-1 * AD74413R_FRAME_SIZE];
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  844  	u8 *tx_buf =3D st->adc_sam=
ples_tx_buf;
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  845  	unsigned int channel;
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  846  	int ret;
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  847  =

fea251b6a5dbdf Cosmin Tanislav 2021-12-05  848  	mutex_lock(&st->lock);
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  849  =

fea251b6a5dbdf Cosmin Tanislav 2021-12-05  850  	spi_message_init(&st->adc_=
samples_msg);
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  851  	st->adc_active_channels =
=3D 0;
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  852  =

fea251b6a5dbdf Cosmin Tanislav 2021-12-05  853  	for_each_clear_bit(channel=
, active_scan_mask, AD74413R_CHANNEL_MAX) {
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  854  		ret =3D ad74413r_set_adc_=
channel_enable(st, channel, false);
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  855  		if (ret)
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  856  			goto out;
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  857  	}
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  858  =

fea251b6a5dbdf Cosmin Tanislav 2021-12-05  859  	if (*active_scan_mask =3D=
=3D 0)
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  860  		goto out;
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  861  =

fea251b6a5dbdf Cosmin Tanislav 2021-12-05  862  	/*
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  863  	 * The read select registe=
r is used to select which register's value
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  864  	 * will be sent by the sla=
ve on the next SPI frame.
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  865  	 *
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  866  	 * Create an SPI message t=
hat, on each step, writes to the read select
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  867  	 * register to select the =
ADC result of the next enabled channel, and
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  868  	 * reads the ADC result of=
 the previous enabled channel.
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  869  	 *
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  870  	 * Example:
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  871  	 * W: [WCH1] [WCH2] [WCH2]=
 [WCH3] [    ]
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  872  	 * R: [    ] [RCH1] [RCH2]=
 [RCH3] [RCH4]
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  873  	 */
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  874  =

fea251b6a5dbdf Cosmin Tanislav 2021-12-05  875  	for_each_set_bit(channel, =
active_scan_mask, AD74413R_CHANNEL_MAX) {
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  876  		ret =3D ad74413r_set_adc_=
channel_enable(st, channel, true);
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  877  		if (ret)
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  878  			goto out;
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  879  =

fea251b6a5dbdf Cosmin Tanislav 2021-12-05  880  		st->adc_active_channels++;
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  881  =

fea251b6a5dbdf Cosmin Tanislav 2021-12-05  882  		if (xfer =3D=3D st->adc_s=
amples_xfer)
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  883  			xfer->rx_buf =3D NULL;
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  884  		else
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  885  			xfer->rx_buf =3D rx_buf;
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  886  =

fea251b6a5dbdf Cosmin Tanislav 2021-12-05  887  		xfer->tx_buf =3D tx_buf;
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  888  		xfer->len =3D AD74413R_FR=
AME_SIZE;
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  889  		xfer->cs_change =3D 1;
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  890  =

fea251b6a5dbdf Cosmin Tanislav 2021-12-05  891  		ad74413r_format_reg_write=
(AD74413R_REG_READ_SELECT,
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  892  					  AD74413R_REG_ADC_RES=
ULT_X(channel),
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  893  					  tx_buf);
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  894  =

fea251b6a5dbdf Cosmin Tanislav 2021-12-05  895  		spi_message_add_tail(xfer=
, &st->adc_samples_msg);
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  896  =

fea251b6a5dbdf Cosmin Tanislav 2021-12-05  897  		xfer++;
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  898  		tx_buf +=3D AD74413R_FRAM=
E_SIZE;
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  899  		rx_buf +=3D AD74413R_FRAM=
E_SIZE;
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  900  	}
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  901  =

fea251b6a5dbdf Cosmin Tanislav 2021-12-05  902  	xfer->rx_buf =3D rx_buf;
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  903  	xfer->tx_buf =3D NULL;
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  904  	xfer->len =3D AD74413R_FRA=
ME_SIZE;
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  905  	xfer->cs_change =3D 0;
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  906  =

fea251b6a5dbdf Cosmin Tanislav 2021-12-05  907  	spi_message_add_tail(xfer,=
 &st->adc_samples_msg);
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  908  =

fea251b6a5dbdf Cosmin Tanislav 2021-12-05  909  out:
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  910  	mutex_unlock(&st->lock);
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  911  =

fea251b6a5dbdf Cosmin Tanislav 2021-12-05 @912  	return ret;
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  913  }
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  914  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0626426367431804899==--

