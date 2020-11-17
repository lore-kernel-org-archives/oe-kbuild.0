Content-Type: multipart/mixed; boundary="===============2217816837250483331=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iio/adc/at91_adc.c:450:16: warning: Shifting signed 32-bit value by 31 bits is undefined behaviour
Date: Tue, 17 Nov 2020 10:53:50 +0800
Message-ID: <202011171044.GPHr922b-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2217816837250483331==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Alexandru Ardelean <alexandru.ardelean@analog.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9c87c9f41245baa3fc4716cf39141439cf405b01
commit: 4027860dcc4cd0c45c36bae21e45bee5a17f2f0f iio: Kconfig: at91_adc: ad=
d COMPILE_TEST dependency to driver
date:   5 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 5 months ago
compiler: s390-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/iio/adc/at91_adc.c:450:16: warning: Shifting signed 32-bit value=
 by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
     if (status & AT91_ADC_ISR_PENS) {
                  ^

vim +450 drivers/iio/adc/at91_adc.c

84882b060301c35 Alexandre Belloni 2014-04-15  417  =

84882b060301c35 Alexandre Belloni 2014-04-15  418  static irqreturn_t at91_=
adc_9x5_interrupt(int irq, void *private)
c8b11de0404d318 Josh Wu           2013-10-08  419  {
c8b11de0404d318 Josh Wu           2013-10-08  420  	struct iio_dev *idev =
=3D private;
c8b11de0404d318 Josh Wu           2013-10-08  421  	struct at91_adc_state *=
st =3D iio_priv(idev);
c8b11de0404d318 Josh Wu           2013-10-08  422  	u32 status =3D at91_adc=
_readl(st, st->registers->status_register);
c8b11de0404d318 Josh Wu           2013-10-08  423  	const uint32_t ts_data_=
irq_mask =3D
c8b11de0404d318 Josh Wu           2013-10-08  424  		AT91_ADC_IER_XRDY |
c8b11de0404d318 Josh Wu           2013-10-08  425  		AT91_ADC_IER_YRDY |
c8b11de0404d318 Josh Wu           2013-10-08  426  		AT91_ADC_IER_PRDY;
c8b11de0404d318 Josh Wu           2013-10-08  427  =

d4f51956ac8ad30 Ludovic Desroches 2014-10-09  428  	if (status & GENMASK(st=
->num_channels - 1, 0))
c8b11de0404d318 Josh Wu           2013-10-08  429  		handle_adc_eoc_trigger=
(irq, idev);
c8b11de0404d318 Josh Wu           2013-10-08  430  =

c8b11de0404d318 Josh Wu           2013-10-08  431  	if (status & AT91_ADC_I=
ER_PEN) {
c8b11de0404d318 Josh Wu           2013-10-08  432  		at91_adc_writel(st, AT=
91_ADC_IDR, AT91_ADC_IER_PEN);
c8b11de0404d318 Josh Wu           2013-10-08  433  		at91_adc_writel(st, AT=
91_ADC_IER, AT91_ADC_IER_NOPEN |
c8b11de0404d318 Josh Wu           2013-10-08  434  			ts_data_irq_mask);
c8b11de0404d318 Josh Wu           2013-10-08  435  		/* Set up period trigg=
er for sampling */
c8b11de0404d318 Josh Wu           2013-10-08  436  		at91_adc_writel(st, st=
->registers->trigger_register,
c8b11de0404d318 Josh Wu           2013-10-08  437  			AT91_ADC_TRGR_MOD_PER=
IOD_TRIG |
c8b11de0404d318 Josh Wu           2013-10-08  438  			AT91_ADC_TRGR_TRGPER_=
(st->ts_sample_period_val));
c8b11de0404d318 Josh Wu           2013-10-08  439  	} else if (status & AT9=
1_ADC_IER_NOPEN) {
c8b11de0404d318 Josh Wu           2013-10-08  440  		at91_adc_writel(st, st=
->registers->trigger_register, 0);
c8b11de0404d318 Josh Wu           2013-10-08  441  		at91_adc_writel(st, AT=
91_ADC_IDR, AT91_ADC_IER_NOPEN |
c8b11de0404d318 Josh Wu           2013-10-08  442  			ts_data_irq_mask);
c8b11de0404d318 Josh Wu           2013-10-08  443  		at91_adc_writel(st, AT=
91_ADC_IER, AT91_ADC_IER_PEN);
c8b11de0404d318 Josh Wu           2013-10-08  444  =

c8b11de0404d318 Josh Wu           2013-10-08  445  		input_report_key(st->t=
s_input, BTN_TOUCH, 0);
c8b11de0404d318 Josh Wu           2013-10-08  446  		input_sync(st->ts_inpu=
t);
c8b11de0404d318 Josh Wu           2013-10-08  447  	} else if ((status & ts=
_data_irq_mask) =3D=3D ts_data_irq_mask) {
c8b11de0404d318 Josh Wu           2013-10-08  448  		/* Now all touchscreen=
 data is ready */
c8b11de0404d318 Josh Wu           2013-10-08  449  =

c8b11de0404d318 Josh Wu           2013-10-08 @450  		if (status & AT91_ADC_=
ISR_PENS) {
c8b11de0404d318 Josh Wu           2013-10-08  451  			/* validate data by p=
en contact */
c8b11de0404d318 Josh Wu           2013-10-08  452  			at91_ts_sample(st);
c8b11de0404d318 Josh Wu           2013-10-08  453  		} else {
c8b11de0404d318 Josh Wu           2013-10-08  454  			/* triggered by event=
 that is no pen contact, just read
c8b11de0404d318 Josh Wu           2013-10-08  455  			 * them to clean the =
interrupt and discard all.
c8b11de0404d318 Josh Wu           2013-10-08  456  			 */
c8b11de0404d318 Josh Wu           2013-10-08  457  			at91_adc_readl(st, AT=
91_ADC_TSXPOSR);
c8b11de0404d318 Josh Wu           2013-10-08  458  			at91_adc_readl(st, AT=
91_ADC_TSYPOSR);
c8b11de0404d318 Josh Wu           2013-10-08  459  			at91_adc_readl(st, AT=
91_ADC_TSPRESSR);
c8b11de0404d318 Josh Wu           2013-10-08  460  		}
c8b11de0404d318 Josh Wu           2013-10-08  461  	}
0e589d5fb3172b0 Maxime Ripard     2012-05-11  462  =

0e589d5fb3172b0 Maxime Ripard     2012-05-11  463  	return IRQ_HANDLED;
0e589d5fb3172b0 Maxime Ripard     2012-05-11  464  }
0e589d5fb3172b0 Maxime Ripard     2012-05-11  465  =


:::::: The code at line 450 was first introduced by commit
:::::: c8b11de0404d318c4a67bf6b9066663b9d93786c iio: at91: introduce touch =
screen support in iio adc driver

:::::: TO: Josh Wu <josh.wu@atmel.com>
:::::: CC: Jonathan Cameron <jic23@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2217816837250483331==--

