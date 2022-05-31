Content-Type: multipart/mixed; boundary="===============7836446909414808762=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iio/adc/at91-sama5d2_adc.c:1781 at91_adc_set_watermark() warn: 'st->dma_st.rx_buf' double freed
Date: Tue, 31 May 2022 09:53:41 +0800
Message-ID: <202205310925.zz2dEYBK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7836446909414808762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Lars-Peter Clausen" <lars@metafoo.de>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8ab2afa23bd197df47819a87f0265c0ac95c5b6a
commit: 907b2ad8c9acad39ac1f0ccdbbe66c63856055e3 iio: at91-sama5d2: Fix inc=
orrect cast to platform_device
date:   6 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 months ago
config: nios2-randconfig-m031-20220530 (https://download.01.org/0day-ci/arc=
hive/20220531/202205310925.zz2dEYBK-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/iio/adc/at91-sama5d2_adc.c:1781 at91_adc_set_watermark() warn: 'st-=
>dma_st.rx_buf' double freed

Old smatch warnings:
drivers/iio/adc/at91-sama5d2_adc.c:2160 at91_adc_resume() warn: ignoring un=
reachable code.

vim +1781 drivers/iio/adc/at91-sama5d2_adc.c

073c662017f2f3 Eugen Hristev      2017-11-15  1747  =

073c662017f2f3 Eugen Hristev      2017-11-15  1748  static int at91_adc_set=
_watermark(struct iio_dev *indio_dev, unsigned int val)
073c662017f2f3 Eugen Hristev      2017-11-15  1749  {
073c662017f2f3 Eugen Hristev      2017-11-15  1750  	struct at91_adc_state =
*st =3D iio_priv(indio_dev);
1a198794451449 Eugen Hristev      2020-09-23  1751  	int ret;
073c662017f2f3 Eugen Hristev      2017-11-15  1752  =

073c662017f2f3 Eugen Hristev      2017-11-15  1753  	if (val > AT91_HWFIFO_=
MAX_SIZE)
073c662017f2f3 Eugen Hristev      2017-11-15  1754  		return -EINVAL;
073c662017f2f3 Eugen Hristev      2017-11-15  1755  =

073c662017f2f3 Eugen Hristev      2017-11-15  1756  	if (!st->selected_trig=
->hw_trig) {
073c662017f2f3 Eugen Hristev      2017-11-15  1757  		dev_dbg(&indio_dev->d=
ev, "we need hw trigger for DMA\n");
073c662017f2f3 Eugen Hristev      2017-11-15  1758  		return 0;
073c662017f2f3 Eugen Hristev      2017-11-15  1759  	}
073c662017f2f3 Eugen Hristev      2017-11-15  1760  =

073c662017f2f3 Eugen Hristev      2017-11-15  1761  	dev_dbg(&indio_dev->de=
v, "new watermark is %u\n", val);
073c662017f2f3 Eugen Hristev      2017-11-15  1762  	st->dma_st.watermark =
=3D val;
073c662017f2f3 Eugen Hristev      2017-11-15  1763  =

073c662017f2f3 Eugen Hristev      2017-11-15  1764  	/*
073c662017f2f3 Eugen Hristev      2017-11-15  1765  	 * The logic here is: =
if we have watermark 1, it means we do
073c662017f2f3 Eugen Hristev      2017-11-15  1766  	 * each conversion wit=
h it's own IRQ, thus we don't need DMA.
073c662017f2f3 Eugen Hristev      2017-11-15  1767  	 * If the watermark is=
 higher, we do DMA to do all the transfers in bulk
073c662017f2f3 Eugen Hristev      2017-11-15  1768  	 */
073c662017f2f3 Eugen Hristev      2017-11-15  1769  =

073c662017f2f3 Eugen Hristev      2017-11-15  1770  	if (val =3D=3D 1)
907b2ad8c9acad Lars-Peter Clausen 2021-10-19  1771  		at91_adc_dma_disable(=
st);
073c662017f2f3 Eugen Hristev      2017-11-15  1772  	else if (val > 1)
907b2ad8c9acad Lars-Peter Clausen 2021-10-19  1773  		at91_adc_dma_init(st);
073c662017f2f3 Eugen Hristev      2017-11-15  1774  =

1a198794451449 Eugen Hristev      2020-09-23  1775  	/*
1a198794451449 Eugen Hristev      2020-09-23  1776  	 * We can start the DM=
A only after setting the watermark and
1a198794451449 Eugen Hristev      2020-09-23  1777  	 * having the DMA init=
ialization completed
1a198794451449 Eugen Hristev      2020-09-23  1778  	 */
1a198794451449 Eugen Hristev      2020-09-23  1779  	ret =3D at91_adc_buffe=
r_prepare(indio_dev);
1a198794451449 Eugen Hristev      2020-09-23  1780  	if (ret)
907b2ad8c9acad Lars-Peter Clausen 2021-10-19 @1781  		at91_adc_dma_disable(=
st);
1a198794451449 Eugen Hristev      2020-09-23  1782  =

1a198794451449 Eugen Hristev      2020-09-23  1783  	return ret;
073c662017f2f3 Eugen Hristev      2017-11-15  1784  }
073c662017f2f3 Eugen Hristev      2017-11-15  1785  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7836446909414808762==--

