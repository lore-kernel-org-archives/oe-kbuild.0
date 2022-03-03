Content-Type: multipart/mixed; boundary="===============7594223003293472733=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jic23-iio:togreg 197/245] drivers/iio/accel/adxl367_spi.c:36:6-17: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
Date: Thu, 03 Mar 2022 15:26:51 +0800
Message-ID: <202203031525.NcFcaQJD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7594223003293472733==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Cosmin Tanislav <demonsingur@gmail.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
head:   0bf126163c3e7e6d722622073046aed567a5551e
commit: cbab791c5e2a58c123d84bd9202c054e5449bc96 [197/245] iio: accel: add =
ADXL367 driver
:::::: branch date: 18 hours ago
:::::: commit date: 10 days ago
config: xtensa-randconfig-c003-20220303 (https://download.01.org/0day-ci/ar=
chive/20220303/202203031525.NcFcaQJD-lkp(a)intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/iio/accel/adxl367_spi.c:36:6-17: WARNING use flexible-array memb=
er instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#=
zero-length-and-one-element-arrays)

vim +36 drivers/iio/accel/adxl367_spi.c

cbab791c5e2a58c Cosmin Tanislav 2022-02-14  17  =

cbab791c5e2a58c Cosmin Tanislav 2022-02-14  18  struct adxl367_spi_state {
cbab791c5e2a58c Cosmin Tanislav 2022-02-14  19  	struct spi_device	*spi;
cbab791c5e2a58c Cosmin Tanislav 2022-02-14  20  =

cbab791c5e2a58c Cosmin Tanislav 2022-02-14  21  	struct spi_message	reg_wri=
te_msg;
cbab791c5e2a58c Cosmin Tanislav 2022-02-14  22  	struct spi_transfer	reg_wr=
ite_xfer[2];
cbab791c5e2a58c Cosmin Tanislav 2022-02-14  23  =

cbab791c5e2a58c Cosmin Tanislav 2022-02-14  24  	struct spi_message	reg_rea=
d_msg;
cbab791c5e2a58c Cosmin Tanislav 2022-02-14  25  	struct spi_transfer	reg_re=
ad_xfer[2];
cbab791c5e2a58c Cosmin Tanislav 2022-02-14  26  =

cbab791c5e2a58c Cosmin Tanislav 2022-02-14  27  	struct spi_message	fifo_ms=
g;
cbab791c5e2a58c Cosmin Tanislav 2022-02-14  28  	struct spi_transfer	fifo_x=
fer[2];
cbab791c5e2a58c Cosmin Tanislav 2022-02-14  29  =

cbab791c5e2a58c Cosmin Tanislav 2022-02-14  30  	/*
cbab791c5e2a58c Cosmin Tanislav 2022-02-14  31  	 * DMA (thus cache coheren=
cy maintenance) requires the
cbab791c5e2a58c Cosmin Tanislav 2022-02-14  32  	 * transfer buffers to liv=
e in their own cache lines.
cbab791c5e2a58c Cosmin Tanislav 2022-02-14  33  	 */
cbab791c5e2a58c Cosmin Tanislav 2022-02-14  34  	u8			reg_write_tx_buf[1] _=
___cacheline_aligned;
cbab791c5e2a58c Cosmin Tanislav 2022-02-14  35  	u8			reg_read_tx_buf[2];
cbab791c5e2a58c Cosmin Tanislav 2022-02-14 @36  	u8			fifo_tx_buf[1];
cbab791c5e2a58c Cosmin Tanislav 2022-02-14  37  };
cbab791c5e2a58c Cosmin Tanislav 2022-02-14  38  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7594223003293472733==--

