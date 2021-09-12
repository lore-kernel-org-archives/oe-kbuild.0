Content-Type: multipart/mixed; boundary="===============3479293857360516747=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 05/16] iio: adc: max1027: Minimize the number of converted channels
Date: Mon, 13 Sep 2021 00:35:49 +0800
Message-ID: <202109130045.vSW7mIpV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3479293857360516747==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210902211437.503623-6-miquel.raynal@bootlin.com>
References: <20210902211437.503623-6-miquel.raynal@bootlin.com>
TO: Miquel Raynal <miquel.raynal@bootlin.com>
TO: Jonathan Cameron <jic23@kernel.org>
TO: "Lars-Peter Clausen" <lars@metafoo.de>
TO: linux-iio(a)vger.kernel.org
TO: linux-kernel(a)vger.kernel.org
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: Nuno Sa <Nuno.Sa@analog.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>

Hi Miquel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on iio/togreg]
[also build test WARNING on v5.14 next-20210910]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Miquel-Raynal/Bring-extern=
al-triggers-support-to-MAX1027-like-ADCs/20210903-052051
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: riscv-randconfig-c006-20210912 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 261cbe=
98c38f8c1ee1a482fe76511110e790f58a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/c7eb401f67f651ff6cbc2f926=
431dddd5c725c1a
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Miquel-Raynal/Bring-external-trigg=
ers-support-to-MAX1027-like-ADCs/20210903-052051
        git checkout c7eb401f67f651ff6cbc2f926431dddd5c725c1a
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   if (ap) {
                       ^~
   drivers/ata/libahci.c:1933:3: note: Taking true branch
                   if (ap) {
                   ^
   drivers/ata/libahci.c:1934:4: note: Calling 'ahci_port_intr'
                           ahci_port_intr(ap);
                           ^~~~~~~~~~~~~~~~~~
   drivers/ata/libahci.c:1896:11: note: Loop condition is false.  Exiting l=
oop
           status =3D readl(port_mmio + PORT_IRQ_STAT);
                    ^
   arch/riscv/include/asm/mmio.h:140:30: note: expanded from macro 'readl'
   #define readl(c)        ({ u32 __v; __io_br(); __v =3D readl_cpu(c); __i=
o_ar(__v); __v; })
                                       ^
   arch/riscv/include/asm/mmio.h:133:19: note: expanded from macro '__io_br'
   #define __io_br()       do {} while (0)
                           ^
   drivers/ata/libahci.c:1899:2: note: Calling 'ahci_handle_port_interrupt'
           ahci_handle_port_interrupt(ap, port_mmio, status);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/libahci.c:1813:19: note: Assuming the condition is true
           int resetting =3D !!(ap->pflags & ATA_PFLAG_RESETTING);
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/libahci.c:1818:2: note: Taking false branch
           if (unlikely(resetting))
           ^
   drivers/ata/libahci.c:1821:6: note: Assuming the condition is false
           if (sata_lpm_ignore_phy_events(&ap->link)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/libahci.c:1821:2: note: Taking false branch
           if (sata_lpm_ignore_phy_events(&ap->link)) {
           ^
   drivers/ata/libahci.c:1826:6: note: Assuming the condition is false
           if (unlikely(status & PORT_IRQ_ERROR)) {
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   drivers/ata/libahci.c:1826:2: note: Taking true branch
           if (unlikely(status & PORT_IRQ_ERROR)) {
           ^
   drivers/ata/libahci.c:1827:3: note: Calling 'ahci_error_intr'
                   ahci_error_intr(ap, status);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/libahci.c:1705:2: note: 'serror' declared without an initial=
 value
           u32 serror;
           ^~~~~~~~~~
   drivers/ata/libahci.c:1708:6: note: Assuming field 'fbs_enabled' is false
           if (pp->fbs_enabled) {
               ^~~~~~~~~~~~~~~
   drivers/ata/libahci.c:1708:2: note: Taking false branch
           if (pp->fbs_enabled) {
           ^
   drivers/ata/libahci.c:1719:3: note: Loop condition is false. Execution c=
ontinues on line 1723
                   ata_for_each_link(link, ap, EDGE)
                   ^
   include/linux/libata.h:1678:2: note: expanded from macro 'ata_for_each_l=
ink'
           for ((link) =3D ata_link_next(NULL, (ap), ATA_LITER_##mode); (li=
nk); \
           ^
   drivers/ata/libahci.c:1723:7: note: 'link' is null
           if (!link)
                ^~~~
   drivers/ata/libahci.c:1723:2: note: Taking true branch
           if (!link)
           ^
   drivers/ata/libahci.c:1734:2: note: Calling 'ahci_scr_read'
           ahci_scr_read(&ap->link, SCR_ERROR, &serror);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/libahci.c:603:6: note: Assuming 'offset' is 0
           if (offset) {
               ^~~~~~
   drivers/ata/libahci.c:603:2: note: Taking false branch
           if (offset) {
           ^
   drivers/ata/libahci.c:607:2: note: Returning without writing to '*val'
           return -EINVAL;
           ^
   drivers/ata/libahci.c:1734:2: note: Returning from 'ahci_scr_read'
           ahci_scr_read(&ap->link, SCR_ERROR, &serror);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/libahci.c:1735:2: note: 3rd function call argument is an uni=
nitialized value
           ahci_scr_write(&ap->link, SCR_ERROR, serror);
           ^                                    ~~~~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/iio/adc/max1027.c:251:8: warning: Excessive padding in 'struct m=
ax1027_state' (83 padding bytes, where 19 is optimal). =

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
   drivers/iio/adc/max1027.c:251:8: note: Excessive padding in 'struct max1=
027_state' (83 padding bytes, where 19 is optimal). Optimal fields order: r=
eg, info, spi, trig, buffer, lock, consider reordering the fields or adding=
 explicit padding members
   struct max1027_state {
   ~~~~~~~^~~~~~~~~~~~~~~
>> drivers/iio/adc/max1027.c:398:14: warning: The result of the left shift =
is undefined because the left operand is negative [clang-analyzer-core.Unde=
finedBinaryOperatorResult]
                   st->reg |=3D MAX1027_CHAN(fls(*indio_dev->active_scan_ma=
sk) - 2);
                              ^
   drivers/iio/adc/max1027.c:38:32: note: expanded from macro 'MAX1027_CHAN'
   #define MAX1027_CHAN(n)   ((n) << 3)
                              ~~~ ^
   drivers/iio/adc/max1027.c:385:6: note: Assuming 'state' is true
           if (state) {
               ^~~~~
   drivers/iio/adc/max1027.c:385:2: note: Taking true branch
           if (state) {
           ^
   drivers/iio/adc/max1027.c:390:7: note: Assuming 'ret' is >=3D 0
                   if (ret < 0)
                       ^~~~~~~
   drivers/iio/adc/max1027.c:390:3: note: Taking false branch
                   if (ret < 0)
                   ^
   drivers/iio/adc/max1027.c:398:14: note: The result of the left shift is =
undefined because the left operand is negative
                   st->reg |=3D MAX1027_CHAN(fls(*indio_dev->active_scan_ma=
sk) - 2);
                              ^
   drivers/iio/adc/max1027.c:38:32: note: expanded from macro 'MAX1027_CHAN'
   #define MAX1027_CHAN(n)   ((n) << 3)
                              ~~~ ^
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/iio/adc/max11100.c:31:8: warning: Excessive padding in 'struct m=
ax11100_state' (117 padding bytes, where 53 is optimal). =

   Optimal fields order: =

   buffer, =

   vref_reg, =

   spi, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct max11100_state {
   ~~~~~~~^~~~~~~~~~~~~~~~
   drivers/iio/adc/max11100.c:31:8: note: Excessive padding in 'struct max1=
1100_state' (117 padding bytes, where 53 is optimal). Optimal fields order:=
 buffer, vref_reg, spi, consider reordering the fields or adding explicit p=
adding members
   struct max11100_state {
   ~~~~~~~^~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/iio/adc/max1241.c:22:8: warning: Excessive padding in 'struct ma=
x1241' (82 padding bytes, where 18 is optimal). =

   Optimal fields order: =

   data, =

   spi, =

   vdd, =

   vref, =

   shutdown, =

   lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct max1241 {
   ~~~~~~~^~~~~~~~~
   drivers/iio/adc/max1241.c:22:8: note: Excessive padding in 'struct max12=
41' (82 padding bytes, where 18 is optimal). Optimal fields order: data, sp=
i, vdd, vref, shutdown, lock, consider reordering the fields or adding expl=
icit padding members
   struct max1241 {
   ~~~~~~~^~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/hwmon/lm63.c:1017:17: warning: Value stored to 'dev' during its =
initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &client->dev;
                          ^~~   ~~~~~~~~~~~~
   drivers/hwmon/lm63.c:1017:17: note: Value stored to 'dev' during its ini=
tialization is never read
           struct device *dev =3D &client->dev;
                          ^~~   ~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/hwmon/lm73.c:76:62: warning: The result of the left shift is und=
efined because the left operand is negative [clang-analyzer-core.UndefinedB=
inaryOperatorResult]
           value =3D clamp_val(temp / 250, LM73_TEMP_MIN, LM73_TEMP_MAX) <<=
 5;
                                                                       ^
   drivers/hwmon/lm73.c:65:41: note: Left side of '&&' is false
           struct sensor_device_attribute *attr =3D to_sensor_dev_attr(da);
                                                  ^
   include/linux/hwmon-sysfs.h:17:2: note: expanded from macro 'to_sensor_d=
ev_attr'
           container_of(_dev_attr, struct sensor_device_attribute, dev_attr)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'

vim +398 drivers/iio/adc/max1027.c

fc167f62483325 Philippe Reynes 2014-06-14  378  =

fc167f62483325 Philippe Reynes 2014-06-14  379  static int max1027_set_trig=
ger_state(struct iio_trigger *trig, bool state)
fc167f62483325 Philippe Reynes 2014-06-14  380  {
fc167f62483325 Philippe Reynes 2014-06-14  381  	struct iio_dev *indio_dev =
=3D iio_trigger_get_drvdata(trig);
fc167f62483325 Philippe Reynes 2014-06-14  382  	struct max1027_state *st =
=3D iio_priv(indio_dev);
fc167f62483325 Philippe Reynes 2014-06-14  383  	int ret;
fc167f62483325 Philippe Reynes 2014-06-14  384  =

fc167f62483325 Philippe Reynes 2014-06-14  385  	if (state) {
fc167f62483325 Philippe Reynes 2014-06-14  386  		/* Start acquisition on c=
nvst */
fc167f62483325 Philippe Reynes 2014-06-14  387  		st->reg =3D MAX1027_SETUP=
_REG | MAX1027_CKS_MODE0 |
fc167f62483325 Philippe Reynes 2014-06-14  388  			  MAX1027_REF_MODE2;
fc167f62483325 Philippe Reynes 2014-06-14  389  		ret =3D spi_write(st->spi=
, &st->reg, 1);
fc167f62483325 Philippe Reynes 2014-06-14  390  		if (ret < 0)
fc167f62483325 Philippe Reynes 2014-06-14  391  			return ret;
fc167f62483325 Philippe Reynes 2014-06-14  392  =

c7eb401f67f651 Miquel Raynal   2021-09-02  393  		/*
c7eb401f67f651 Miquel Raynal   2021-09-02  394  		 * Scan from chan 0 to th=
e highest requested channel.
c7eb401f67f651 Miquel Raynal   2021-09-02  395  		 * Include temperature on=
 demand.
c7eb401f67f651 Miquel Raynal   2021-09-02  396  		 */
c7eb401f67f651 Miquel Raynal   2021-09-02  397  		st->reg =3D MAX1027_CONV_=
REG | MAX1027_SCAN_0_N;
c7eb401f67f651 Miquel Raynal   2021-09-02 @398  		st->reg |=3D MAX1027_CHAN=
(fls(*indio_dev->active_scan_mask) - 2);
c7eb401f67f651 Miquel Raynal   2021-09-02  399  		if (*indio_dev->active_sc=
an_mask & MAX1X27_SCAN_MASK_TEMP)
c7eb401f67f651 Miquel Raynal   2021-09-02  400  			st->reg |=3D MAX1027_TEM=
P;
c7eb401f67f651 Miquel Raynal   2021-09-02  401  =

fc167f62483325 Philippe Reynes 2014-06-14  402  		ret =3D spi_write(st->spi=
, &st->reg, 1);
fc167f62483325 Philippe Reynes 2014-06-14  403  		if (ret < 0)
fc167f62483325 Philippe Reynes 2014-06-14  404  			return ret;
fc167f62483325 Philippe Reynes 2014-06-14  405  	} else {
fc167f62483325 Philippe Reynes 2014-06-14  406  		/* Start acquisition on c=
onversion register write */
fc167f62483325 Philippe Reynes 2014-06-14  407  		st->reg =3D MAX1027_SETUP=
_REG | MAX1027_CKS_MODE2	|
fc167f62483325 Philippe Reynes 2014-06-14  408  			  MAX1027_REF_MODE2;
fc167f62483325 Philippe Reynes 2014-06-14  409  		ret =3D spi_write(st->spi=
, &st->reg, 1);
fc167f62483325 Philippe Reynes 2014-06-14  410  		if (ret < 0)
fc167f62483325 Philippe Reynes 2014-06-14  411  			return ret;
fc167f62483325 Philippe Reynes 2014-06-14  412  	}
fc167f62483325 Philippe Reynes 2014-06-14  413  =

fc167f62483325 Philippe Reynes 2014-06-14  414  	return 0;
fc167f62483325 Philippe Reynes 2014-06-14  415  }
fc167f62483325 Philippe Reynes 2014-06-14  416  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--===============3479293857360516747==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
AgA=
--===============3479293857360516747==--

