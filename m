Content-Type: multipart/mixed; boundary="===============3074338226276295547=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iio/adc/max1027.c:412:14: warning: The result of the left shift is undefined because the left operand is negative [clang-analyzer-core.UndefinedBinaryOperatorResult]
Date: Sat, 06 Nov 2021 17:20:10 +0800
Message-ID: <202111061757.mO45CPeK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3074338226276295547==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Miquel Raynal <miquel.raynal@bootlin.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/0day-ci/linux/commits/Miquel-Raynal/Bring-extern=
al-triggers-support-to-MAX1027-like-ADCs/20210922-131741
head:   82403933ab13283e98041a4c285420988531362c
commit: 1e80dcadd79f6dec7346dc596fbafd508ea2844e iio: adc: max1027: Minimiz=
e the number of converted channels
date:   6 weeks ago
:::::: branch date: 6 weeks ago
:::::: commit date: 6 weeks ago
config: riscv-randconfig-c006-20210927 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dc6e8d=
fdfe7efecfda318d43a06fae18b40eb498)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/1e80dcadd79f6dec7346dc596=
fbafd508ea2844e
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Miquel-Raynal/Bring-external-trigg=
ers-support-to-MAX1027-like-ADCs/20210922-131741
        git checkout 1e80dcadd79f6dec7346dc596fbafd508ea2844e
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           info.offset =3D plane << fls(nand->memorg.pagesize);
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/spi/core.c:850:22: note: The result of the left shift i=
s undefined due to shifting by '32', which is greater or equal to the width=
 of type 'unsigned int'
           info.offset =3D plane << fls(nand->memorg.pagesize);
                               ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/usb/core/message.c:1709:2: warning: Value stored to 'retval' is =
never read [clang-analyzer-deadcode.DeadStores]
           retval =3D 0;
           ^        ~
   drivers/usb/core/message.c:1709:2: note: Value stored to 'retval' is nev=
er read
           retval =3D 0;
           ^        ~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/usb/core/driver.c:1675:2: warning: Value stored to 'status' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           status =3D pm_runtime_put_sync_autosuspend(&udev->dev);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/driver.c:1675:2: note: Value stored to 'status' is neve=
r read
           status =3D pm_runtime_put_sync_autosuspend(&udev->dev);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/driver.c:1737:2: warning: Value stored to 'status' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           status =3D pm_runtime_put_sync(&intf->dev);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/driver.c:1737:2: note: Value stored to 'status' is neve=
r read
           status =3D pm_runtime_put_sync(&intf->dev);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/driver.c:1765:2: warning: Value stored to 'status' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           status =3D pm_runtime_put(&intf->dev);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/driver.c:1765:2: note: Value stored to 'status' is neve=
r read
           status =3D pm_runtime_put(&intf->dev);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/usb/core/file.c:160:6: warning: Value stored to 'minor_base' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           int minor_base =3D class_driver->minor_base;
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/file.c:160:6: note: Value stored to 'minor_base' during=
 its initialization is never read
           int minor_base =3D class_driver->minor_base;
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/gpu/drm/amd/amdgpu/dce_v10_0.c:1259:3: warning: Value stored to =
'tmp' is never read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D REG_SET_FIELD(0, AZALIA_F0_CODEC_PIN_CONTROL_RES=
PONSE_LIPSYNC,
                   ^
   drivers/gpu/drm/amd/amdgpu/dce_v10_0.c:1259:3: note: Value stored to 'tm=
p' is never read
   drivers/gpu/drm/amd/amdgpu/dce_v10_0.c:1264:3: warning: Value stored to =
'tmp' is never read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D REG_SET_FIELD(0, AZALIA_F0_CODEC_PIN_CONTROL_RES=
PONSE_LIPSYNC,
                   ^
   drivers/gpu/drm/amd/amdgpu/dce_v10_0.c:1264:3: note: Value stored to 'tm=
p' is never read
   drivers/gpu/drm/amd/amdgpu/dce_v10_0.c:2970:3: warning: Value stored to =
'tmp' is never read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D RREG32(mmSRBM_SOFT_RESET);
                   ^
   drivers/gpu/drm/amd/amdgpu/dce_v10_0.c:2970:3: note: Value stored to 'tm=
p' is never read
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/iio/adc/max1027.c:265:8: warning: Excessive padding in 'struct m=
ax1027_state' (99 padding bytes, where 35 is optimal). =

   Optimal fields order: =

   reg, =

   info, =

   spi, =

   trig, =

   buffer, =

   lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct max1027_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/adc/max1027.c:265:8: note: Excessive padding in 'struct max1=
027_state' (99 padding bytes, where 35 is optimal). Optimal fields order: r=
eg, info, spi, trig, buffer, lock, consider reordering the fields or adding=
 explicit padding members
   struct max1027_state {
   ~~~~~~~^~~~~~~~~~~~~~~
>> drivers/iio/adc/max1027.c:412:14: warning: The result of the left shift =
is undefined because the left operand is negative [clang-analyzer-core.Unde=
finedBinaryOperatorResult]
                   st->reg |=3D MAX1027_CHAN(fls(*indio_dev->active_scan_ma=
sk) - 2);
                              ^
   drivers/iio/adc/max1027.c:38:32: note: expanded from macro 'MAX1027_CHAN'
   #define MAX1027_CHAN(n)   ((n) << 3)
                              ~~~ ^
   drivers/iio/adc/max1027.c:399:6: note: Assuming 'state' is true
           if (state) {
               ^~~~~
   drivers/iio/adc/max1027.c:399:2: note: Taking true branch
           if (state) {
           ^
   drivers/iio/adc/max1027.c:404:7: note: Assuming 'ret' is >=3D 0
                   if (ret < 0)
                       ^~~~~~~
   drivers/iio/adc/max1027.c:404:3: note: Taking false branch
                   if (ret < 0)
                   ^
   drivers/iio/adc/max1027.c:412:14: note: The result of the left shift is =
undefined because the left operand is negative
                   st->reg |=3D MAX1027_CHAN(fls(*indio_dev->active_scan_ma=
sk) - 2);
                              ^
   drivers/iio/adc/max1027.c:38:32: note: expanded from macro 'MAX1027_CHAN'
   #define MAX1027_CHAN(n)   ((n) << 3)
                              ~~~ ^
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/w1/slaves/w1_therm.c:1252:5: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                                   ret =3D -EIO;
                                   ^     ~~~~
   drivers/w1/slaves/w1_therm.c:1252:5: note: Value stored to 'ret' is neve=
r read
                                   ret =3D -EIO;
                                   ^     ~~~~
   drivers/w1/slaves/w1_therm.c:1799:2: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(p_args, buf);
           ^~~~~~
   drivers/w1/slaves/w1_therm.c:1799:2: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
           strcpy(p_args, buf);
           ^~~~~~
   drivers/w1/slaves/w1_therm.c:2090:22: warning: The right operand of '=3D=
=3D' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   if (sl->reg_num.id =3D=3D reg_num->id)
                                      ^  ~~~~~~~~~~~
   drivers/w1/slaves/w1_therm.c:2067:6: note: Assuming the condition is fal=
se
           if (w1_reset_bus(sl->master))
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/slaves/w1_therm.c:2067:2: note: Taking false branch
           if (w1_reset_bus(sl->master))
           ^
   drivers/w1/slaves/w1_therm.c:2077:6: note: Assuming 'ack' is equal to W1=
_42_SUCCESS_CONFIRM_BYTE
           if (ack !=3D W1_42_SUCCESS_CONFIRM_BYTE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/slaves/w1_therm.c:2077:2: note: Taking false branch
           if (ack !=3D W1_42_SUCCESS_CONFIRM_BYTE)
           ^
   drivers/w1/slaves/w1_therm.c:2081:2: note: Loop condition is true.  Ente=
ring loop body
           for (i =3D 0; i <=3D 64; i++) {
           ^
   drivers/w1/slaves/w1_therm.c:2082:7: note: Assuming the condition is fal=
se
                   if (w1_reset_bus(sl->master))
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/slaves/w1_therm.c:2082:3: note: Taking false branch
                   if (w1_reset_bus(sl->master))
                   ^
   drivers/w1/slaves/w1_therm.c:2088:7: note: Assuming field 'family' is no=
t equal to W1_42_FINISHED_BYTE
                   if (reg_num->family =3D=3D W1_42_FINISHED_BYTE)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/slaves/w1_therm.c:2088:3: note: Taking false branch
                   if (reg_num->family =3D=3D W1_42_FINISHED_BYTE)
                   ^
   drivers/w1/slaves/w1_therm.c:2090:22: note: The right operand of '=3D=3D=
' is a garbage value
                   if (sl->reg_num.id =3D=3D reg_num->id)
                                      ^  ~~~~~~~~~~~
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +412 drivers/iio/adc/max1027.c

fc167f62483325 Philippe Reynes 2014-06-14  264  =

fc167f62483325 Philippe Reynes 2014-06-14 @265  struct max1027_state {
fc167f62483325 Philippe Reynes 2014-06-14  266  	const struct max1027_chip_=
info	*info;
fc167f62483325 Philippe Reynes 2014-06-14  267  	struct spi_device		*spi;
fc167f62483325 Philippe Reynes 2014-06-14  268  	struct iio_trigger		*trig;
fc167f62483325 Philippe Reynes 2014-06-14  269  	__be16				*buffer;
fc167f62483325 Philippe Reynes 2014-06-14  270  	struct mutex			lock;
fc167f62483325 Philippe Reynes 2014-06-14  271  =

fc167f62483325 Philippe Reynes 2014-06-14  272  	u8				reg ____cacheline_al=
igned;
fc167f62483325 Philippe Reynes 2014-06-14  273  };
fc167f62483325 Philippe Reynes 2014-06-14  274  =

fc167f62483325 Philippe Reynes 2014-06-14  275  static int max1027_read_sin=
gle_value(struct iio_dev *indio_dev,
fc167f62483325 Philippe Reynes 2014-06-14  276  				     struct iio_chan_sp=
ec const *chan,
fc167f62483325 Philippe Reynes 2014-06-14  277  				     int *val)
fc167f62483325 Philippe Reynes 2014-06-14  278  {
fc167f62483325 Philippe Reynes 2014-06-14  279  	int ret;
fc167f62483325 Philippe Reynes 2014-06-14  280  	struct max1027_state *st =
=3D iio_priv(indio_dev);
fc167f62483325 Philippe Reynes 2014-06-14  281  =

fc167f62483325 Philippe Reynes 2014-06-14  282  	if (iio_buffer_enabled(ind=
io_dev)) {
fc167f62483325 Philippe Reynes 2014-06-14  283  		dev_warn(&indio_dev->dev,=
 "trigger mode already enabled");
fc167f62483325 Philippe Reynes 2014-06-14  284  		return -EBUSY;
fc167f62483325 Philippe Reynes 2014-06-14  285  	}
fc167f62483325 Philippe Reynes 2014-06-14  286  =

fc167f62483325 Philippe Reynes 2014-06-14  287  	/* Start acquisition on co=
nversion register write */
fc167f62483325 Philippe Reynes 2014-06-14  288  	st->reg =3D MAX1027_SETUP_=
REG | MAX1027_REF_MODE2 | MAX1027_CKS_MODE2;
fc167f62483325 Philippe Reynes 2014-06-14  289  	ret =3D spi_write(st->spi,=
 &st->reg, 1);
fc167f62483325 Philippe Reynes 2014-06-14  290  	if (ret < 0) {
fc167f62483325 Philippe Reynes 2014-06-14  291  		dev_err(&indio_dev->dev,
fc167f62483325 Philippe Reynes 2014-06-14  292  			"Failed to configure set=
up register\n");
fc167f62483325 Philippe Reynes 2014-06-14  293  		return ret;
fc167f62483325 Philippe Reynes 2014-06-14  294  	}
fc167f62483325 Philippe Reynes 2014-06-14  295  =

fc167f62483325 Philippe Reynes 2014-06-14  296  	/* Configure conversion re=
gister with the requested chan */
fc167f62483325 Philippe Reynes 2014-06-14  297  	st->reg =3D MAX1027_CONV_R=
EG | MAX1027_CHAN(chan->channel) |
58b90a8d2c397a Sandhya Bankar  2016-09-24  298  		  MAX1027_NOSCAN;
58b90a8d2c397a Sandhya Bankar  2016-09-24  299  	if (chan->type =3D=3D IIO_=
TEMP)
58b90a8d2c397a Sandhya Bankar  2016-09-24  300  		st->reg |=3D MAX1027_TEMP;
fc167f62483325 Philippe Reynes 2014-06-14  301  	ret =3D spi_write(st->spi,=
 &st->reg, 1);
fc167f62483325 Philippe Reynes 2014-06-14  302  	if (ret < 0) {
fc167f62483325 Philippe Reynes 2014-06-14  303  		dev_err(&indio_dev->dev,
fc167f62483325 Philippe Reynes 2014-06-14  304  			"Failed to configure con=
version register\n");
fc167f62483325 Philippe Reynes 2014-06-14  305  		return ret;
fc167f62483325 Philippe Reynes 2014-06-14  306  	}
fc167f62483325 Philippe Reynes 2014-06-14  307  =

fc167f62483325 Philippe Reynes 2014-06-14  308  	/*
fc167f62483325 Philippe Reynes 2014-06-14  309  	 * For an unknown reason, =
when we use the mode "10" (write
fc167f62483325 Philippe Reynes 2014-06-14  310  	 * conversion register), t=
he interrupt doesn't occur every time.
fc167f62483325 Philippe Reynes 2014-06-14  311  	 * So we just wait 1 ms.
fc167f62483325 Philippe Reynes 2014-06-14  312  	 */
fc167f62483325 Philippe Reynes 2014-06-14  313  	mdelay(1);
fc167f62483325 Philippe Reynes 2014-06-14  314  =

fc167f62483325 Philippe Reynes 2014-06-14  315  	/* Read result */
fc167f62483325 Philippe Reynes 2014-06-14  316  	ret =3D spi_read(st->spi, =
st->buffer, (chan->type =3D=3D IIO_TEMP) ? 4 : 2);
fc167f62483325 Philippe Reynes 2014-06-14  317  	if (ret < 0)
fc167f62483325 Philippe Reynes 2014-06-14  318  		return ret;
fc167f62483325 Philippe Reynes 2014-06-14  319  =

fc167f62483325 Philippe Reynes 2014-06-14  320  	*val =3D be16_to_cpu(st->b=
uffer[0]);
fc167f62483325 Philippe Reynes 2014-06-14  321  =

fc167f62483325 Philippe Reynes 2014-06-14  322  	return IIO_VAL_INT;
fc167f62483325 Philippe Reynes 2014-06-14  323  }
fc167f62483325 Philippe Reynes 2014-06-14  324  =

fc167f62483325 Philippe Reynes 2014-06-14  325  static int max1027_read_raw=
(struct iio_dev *indio_dev,
fc167f62483325 Philippe Reynes 2014-06-14  326  			    struct iio_chan_spec=
 const *chan,
fc167f62483325 Philippe Reynes 2014-06-14  327  			    int *val, int *val2,=
 long mask)
fc167f62483325 Philippe Reynes 2014-06-14  328  {
fc167f62483325 Philippe Reynes 2014-06-14  329  	int ret =3D 0;
fc167f62483325 Philippe Reynes 2014-06-14  330  	struct max1027_state *st =
=3D iio_priv(indio_dev);
fc167f62483325 Philippe Reynes 2014-06-14  331  =

fc167f62483325 Philippe Reynes 2014-06-14  332  	mutex_lock(&st->lock);
fc167f62483325 Philippe Reynes 2014-06-14  333  =

fc167f62483325 Philippe Reynes 2014-06-14  334  	switch (mask) {
fc167f62483325 Philippe Reynes 2014-06-14  335  	case IIO_CHAN_INFO_RAW:
fc167f62483325 Philippe Reynes 2014-06-14  336  		ret =3D max1027_read_sing=
le_value(indio_dev, chan, val);
fc167f62483325 Philippe Reynes 2014-06-14  337  		break;
fc167f62483325 Philippe Reynes 2014-06-14  338  	case IIO_CHAN_INFO_SCALE:
fc167f62483325 Philippe Reynes 2014-06-14  339  		switch (chan->type) {
fc167f62483325 Philippe Reynes 2014-06-14  340  		case IIO_TEMP:
fc167f62483325 Philippe Reynes 2014-06-14  341  			*val =3D 1;
fc167f62483325 Philippe Reynes 2014-06-14  342  			*val2 =3D 8;
fc167f62483325 Philippe Reynes 2014-06-14  343  			ret =3D IIO_VAL_FRACTION=
AL;
fc167f62483325 Philippe Reynes 2014-06-14  344  			break;
fc167f62483325 Philippe Reynes 2014-06-14  345  		case IIO_VOLTAGE:
fc167f62483325 Philippe Reynes 2014-06-14  346  			*val =3D 2500;
7af5257d84275c Miquel Raynal   2019-10-11  347  			*val2 =3D chan->scan_typ=
e.realbits;
fc167f62483325 Philippe Reynes 2014-06-14  348  			ret =3D IIO_VAL_FRACTION=
AL_LOG2;
fc167f62483325 Philippe Reynes 2014-06-14  349  			break;
fc167f62483325 Philippe Reynes 2014-06-14  350  		default:
fc167f62483325 Philippe Reynes 2014-06-14  351  			ret =3D -EINVAL;
fc167f62483325 Philippe Reynes 2014-06-14  352  			break;
fc167f62483325 Philippe Reynes 2014-06-14  353  		}
fc167f62483325 Philippe Reynes 2014-06-14  354  		break;
fc167f62483325 Philippe Reynes 2014-06-14  355  	default:
fc167f62483325 Philippe Reynes 2014-06-14  356  		ret =3D -EINVAL;
fc167f62483325 Philippe Reynes 2014-06-14  357  		break;
fc167f62483325 Philippe Reynes 2014-06-14  358  	}
fc167f62483325 Philippe Reynes 2014-06-14  359  =

fc167f62483325 Philippe Reynes 2014-06-14  360  	mutex_unlock(&st->lock);
fc167f62483325 Philippe Reynes 2014-06-14  361  =

fc167f62483325 Philippe Reynes 2014-06-14  362  	return ret;
fc167f62483325 Philippe Reynes 2014-06-14  363  }
fc167f62483325 Philippe Reynes 2014-06-14  364  =

fc167f62483325 Philippe Reynes 2014-06-14  365  static int max1027_debugfs_=
reg_access(struct iio_dev *indio_dev,
825ca5fefb8af9 Miquel Raynal   2021-09-21  366  				      unsigned int reg,=
 unsigned int writeval,
825ca5fefb8af9 Miquel Raynal   2021-09-21  367  				      unsigned int *rea=
dval)
fc167f62483325 Philippe Reynes 2014-06-14  368  {
fc167f62483325 Philippe Reynes 2014-06-14  369  	struct max1027_state *st =
=3D iio_priv(indio_dev);
fc167f62483325 Philippe Reynes 2014-06-14  370  	u8 *val =3D (u8 *)st->buff=
er;
fc167f62483325 Philippe Reynes 2014-06-14  371  =

038696f8bd2f2e Miquel Raynal   2019-10-11  372  	if (readval) {
038696f8bd2f2e Miquel Raynal   2019-10-11  373  		int ret =3D spi_read(st->=
spi, val, 2);
038696f8bd2f2e Miquel Raynal   2019-10-11  374  		*readval =3D be16_to_cpu(=
st->buffer[0]);
038696f8bd2f2e Miquel Raynal   2019-10-11  375  		return ret;
038696f8bd2f2e Miquel Raynal   2019-10-11  376  	}
fc167f62483325 Philippe Reynes 2014-06-14  377  =

fc167f62483325 Philippe Reynes 2014-06-14  378  	*val =3D (u8)writeval;
fc167f62483325 Philippe Reynes 2014-06-14  379  	return spi_write(st->spi, =
val, 1);
fc167f62483325 Philippe Reynes 2014-06-14  380  }
fc167f62483325 Philippe Reynes 2014-06-14  381  =

fc167f62483325 Philippe Reynes 2014-06-14  382  static int max1027_validate=
_trigger(struct iio_dev *indio_dev,
fc167f62483325 Philippe Reynes 2014-06-14  383  				    struct iio_trigger =
*trig)
fc167f62483325 Philippe Reynes 2014-06-14  384  {
fc167f62483325 Philippe Reynes 2014-06-14  385  	struct max1027_state *st =
=3D iio_priv(indio_dev);
fc167f62483325 Philippe Reynes 2014-06-14  386  =

fc167f62483325 Philippe Reynes 2014-06-14  387  	if (st->trig !=3D trig)
fc167f62483325 Philippe Reynes 2014-06-14  388  		return -EINVAL;
fc167f62483325 Philippe Reynes 2014-06-14  389  =

fc167f62483325 Philippe Reynes 2014-06-14  390  	return 0;
fc167f62483325 Philippe Reynes 2014-06-14  391  }
fc167f62483325 Philippe Reynes 2014-06-14  392  =

fc167f62483325 Philippe Reynes 2014-06-14  393  static int max1027_set_trig=
ger_state(struct iio_trigger *trig, bool state)
fc167f62483325 Philippe Reynes 2014-06-14  394  {
fc167f62483325 Philippe Reynes 2014-06-14  395  	struct iio_dev *indio_dev =
=3D iio_trigger_get_drvdata(trig);
fc167f62483325 Philippe Reynes 2014-06-14  396  	struct max1027_state *st =
=3D iio_priv(indio_dev);
fc167f62483325 Philippe Reynes 2014-06-14  397  	int ret;
fc167f62483325 Philippe Reynes 2014-06-14  398  =

fc167f62483325 Philippe Reynes 2014-06-14  399  	if (state) {
fc167f62483325 Philippe Reynes 2014-06-14  400  		/* Start acquisition on c=
nvst */
fc167f62483325 Philippe Reynes 2014-06-14  401  		st->reg =3D MAX1027_SETUP=
_REG | MAX1027_CKS_MODE0 |
fc167f62483325 Philippe Reynes 2014-06-14  402  			  MAX1027_REF_MODE2;
fc167f62483325 Philippe Reynes 2014-06-14  403  		ret =3D spi_write(st->spi=
, &st->reg, 1);
fc167f62483325 Philippe Reynes 2014-06-14  404  		if (ret < 0)
fc167f62483325 Philippe Reynes 2014-06-14  405  			return ret;
fc167f62483325 Philippe Reynes 2014-06-14  406  =

1e80dcadd79f6d Miquel Raynal   2021-09-21  407  		/*
1e80dcadd79f6d Miquel Raynal   2021-09-21  408  		 * Scan from chan 0 to th=
e highest requested channel.
1e80dcadd79f6d Miquel Raynal   2021-09-21  409  		 * Include temperature on=
 demand.
1e80dcadd79f6d Miquel Raynal   2021-09-21  410  		 */
1e80dcadd79f6d Miquel Raynal   2021-09-21  411  		st->reg =3D MAX1027_CONV_=
REG | MAX1027_SCAN_0_N;
1e80dcadd79f6d Miquel Raynal   2021-09-21 @412  		st->reg |=3D MAX1027_CHAN=
(fls(*indio_dev->active_scan_mask) - 2);
1e80dcadd79f6d Miquel Raynal   2021-09-21  413  		if (*indio_dev->active_sc=
an_mask & MAX1X27_SCAN_MASK_TEMP)
1e80dcadd79f6d Miquel Raynal   2021-09-21  414  			st->reg |=3D MAX1027_TEM=
P;
1e80dcadd79f6d Miquel Raynal   2021-09-21  415  =

fc167f62483325 Philippe Reynes 2014-06-14  416  		ret =3D spi_write(st->spi=
, &st->reg, 1);
fc167f62483325 Philippe Reynes 2014-06-14  417  		if (ret < 0)
fc167f62483325 Philippe Reynes 2014-06-14  418  			return ret;
fc167f62483325 Philippe Reynes 2014-06-14  419  	} else {
fc167f62483325 Philippe Reynes 2014-06-14  420  		/* Start acquisition on c=
onversion register write */
fc167f62483325 Philippe Reynes 2014-06-14  421  		st->reg =3D MAX1027_SETUP=
_REG | MAX1027_CKS_MODE2	|
fc167f62483325 Philippe Reynes 2014-06-14  422  			  MAX1027_REF_MODE2;
fc167f62483325 Philippe Reynes 2014-06-14  423  		ret =3D spi_write(st->spi=
, &st->reg, 1);
fc167f62483325 Philippe Reynes 2014-06-14  424  		if (ret < 0)
fc167f62483325 Philippe Reynes 2014-06-14  425  			return ret;
fc167f62483325 Philippe Reynes 2014-06-14  426  	}
fc167f62483325 Philippe Reynes 2014-06-14  427  =

fc167f62483325 Philippe Reynes 2014-06-14  428  	return 0;
fc167f62483325 Philippe Reynes 2014-06-14  429  }
fc167f62483325 Philippe Reynes 2014-06-14  430  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--===============3074338226276295547==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3074338226276295547==--

