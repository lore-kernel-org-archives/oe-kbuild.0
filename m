Content-Type: multipart/mixed; boundary="===============3377784648516288415=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ambarus:sama7g5-qspi-for-broonie-v2 20/21] drivers/spi/atmel-quadspi.c:986 atmel_qspi_exec_op() error: uninitialized symbol 'offset'.
Date: Thu, 09 Dec 2021 14:42:47 +0800
Message-ID: <202112091430.3ElBx8iW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3377784648516288415==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Tudor Ambarus <tudor.ambarus@microchip.com>

tree:   https://github.com/ambarus/linux-0day sama7g5-qspi-for-broonie-v2
head:   1fbd20943203727424df62e17c565f1b3a49a542
commit: 97f2a2c3d5f512f18f59a2066e6da47c0fca09e5 [20/21] spi: atmel-quadspi=
: Add support for sama7g5 QSPI
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: arc-randconfig-m031-20211207 (https://download.01.org/0day-ci/archi=
ve/20211209/202112091430.3ElBx8iW-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/spi/atmel-quadspi.c:986 atmel_qspi_exec_op() error: uninitialized s=
ymbol 'offset'.
drivers/spi/atmel-quadspi.c:1234 atmel_qspi_dma_init() warn: passing zero t=
o 'PTR_ERR'

vim +/offset +986 drivers/spi/atmel-quadspi.c

97f2a2c3d5f512 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-10-1=
9  964  =

97f2a2c3d5f512 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-10-1=
9  965  static int atmel_qspi_exec_op(struct spi_mem *mem, const struct spi=
_mem_op *op)
97f2a2c3d5f512 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-10-1=
9  966  {
97f2a2c3d5f512 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-10-1=
9  967  	struct atmel_qspi *aq =3D spi_controller_get_devdata(mem->spi->mas=
ter);
97f2a2c3d5f512 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-10-1=
9  968  	u32 offset;
97f2a2c3d5f512 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-10-1=
9  969  	int err;
97f2a2c3d5f512 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-10-1=
9  970  =

97f2a2c3d5f512 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-10-1=
9  971  	/*
97f2a2c3d5f512 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-10-1=
9  972  	 * Check if the address exceeds the MMIO window size. An improveme=
nt
97f2a2c3d5f512 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-10-1=
9  973  	 * would be to add support for regular SPI mode and fall back to it
97f2a2c3d5f512 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-10-1=
9  974  	 * when the flash memories overrun the controller's memory space.
97f2a2c3d5f512 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-10-1=
9  975  	 */
97f2a2c3d5f512 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-10-1=
9  976  	if (op->addr.val + op->data.nbytes > aq->mmap_size)
97f2a2c3d5f512 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-10-1=
9  977  		return -EOPNOTSUPP;
97f2a2c3d5f512 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-10-1=
9  978  =

97f2a2c3d5f512 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-10-1=
9  979  	if (op->addr.nbytes > 4)
97f2a2c3d5f512 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-10-1=
9  980  		return -EOPNOTSUPP;
97f2a2c3d5f512 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-10-1=
9  981  =

97f2a2c3d5f512 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-10-1=
9  982  	err =3D aq->ops->set_cfg(aq, op, &offset);
97f2a2c3d5f512 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-10-1=
9  983  	if (err)
d5433def31531b drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-0=
5  984  		return err;
97f2a2c3d5f512 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-10-1=
9  985  =

97f2a2c3d5f512 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-10-1=
9 @986  	return aq->ops->transfer(mem, op, offset);
d5433def31531b drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-0=
5  987  }
d5433def31531b drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-0=
5  988  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3377784648516288415==--

