Content-Type: multipart/mixed; boundary="===============8170958621108048751=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ambarus:spi-nor/port-gbulk-v5.8 3/3] drivers/spi/atmel-quadspi.c:440:10: warning: Identical condition 'err', second condition is always false
Date: Thu, 16 Jul 2020 04:39:29 +0800
Message-ID: <202007160423.YQAfgEiL%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8170958621108048751==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Tudor Ambarus <tudor.ambarus@microchip.com>

tree:   https://github.com/ambarus/linux-0day spi-nor/port-gbulk-v5.8
head:   38278daad477e9dff1fc6f4f79bec89569404696
commit: 38278daad477e9dff1fc6f4f79bec89569404696 [3/3] spi: atmel-quadspi: =
Use optimezed memcpy_fromio()/memcpy_toio()
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
compiler: gcc-9 (Debian 9.3.0-14) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/spi/atmel-quadspi.c:440:10: warning: Identical condition 'err', =
second condition is always false [identicalConditionAfterEarlyExit]
     return err;
            ^
   drivers/spi/atmel-quadspi.c:417:6: note: first condition
    if (err)
        ^
   drivers/spi/atmel-quadspi.c:440:10: note: second condition
     return err;
            ^

# https://github.com/ambarus/linux-0day/commit/38278daad477e9dff1fc6f4f79be=
c89569404696
git remote add ambarus https://github.com/ambarus/linux-0day
git remote update ambarus
git checkout 38278daad477e9dff1fc6f4f79bec89569404696
vim +/err +440 drivers/spi/atmel-quadspi.c

2e5c8888735864 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2019-02-0=
5  401  =

2e5c8888735864 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2019-02-0=
5  402  static int atmel_qspi_exec_op(struct spi_mem *mem, const struct spi=
_mem_op *op)
2e5c8888735864 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2019-02-0=
5  403  {
2e5c8888735864 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2019-02-0=
5  404  	struct atmel_qspi *aq =3D spi_controller_get_devdata(mem->spi->mas=
ter);
2e5c8888735864 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2019-02-0=
5  405  	u32 sr, offset;
2e5c8888735864 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2019-02-0=
5  406  	int err;
2e5c8888735864 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2019-02-0=
5  407  =

8e093ea4d35933 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-02-2=
8  408  	/*
8e093ea4d35933 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-02-2=
8  409  	 * Check if the address exceeds the MMIO window size. An improveme=
nt
8e093ea4d35933 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-02-2=
8  410  	 * would be to add support for regular SPI mode and fall back to it
8e093ea4d35933 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-02-2=
8  411  	 * when the flash memories overrun the controller's memory space.
8e093ea4d35933 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-02-2=
8  412  	 */
8e093ea4d35933 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-02-2=
8  413  	if (op->addr.val + op->data.nbytes > aq->mmap_size)
8e093ea4d35933 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-02-2=
8  414  		return -ENOTSUPP;
8e093ea4d35933 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-02-2=
8  415  =

2e5c8888735864 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2019-02-0=
5  416  	err =3D atmel_qspi_set_cfg(aq, op, &offset);
2e5c8888735864 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2019-02-0=
5  417  	if (err)
2e5c8888735864 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2019-02-0=
5  418  		return err;
d5433def31531b drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-0=
5  419  =

d5433def31531b drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-0=
5  420  	/* Skip to the final steps if there is no data */
d5433def31531b drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-0=
5  421  	if (op->data.nbytes) {
d5433def31531b drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-0=
5  422  		/* Dummy read of QSPI_IFR to synchronize APB and AHB accesses */
c528ecfbef040b drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-03-2=
0  423  		(void)atmel_qspi_read(aq, QSPI_IFR);
d5433def31531b drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-0=
5  424  =

d5433def31531b drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-0=
5  425  		/* Send/Receive data */
d5433def31531b drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-0=
5  426  		if (op->data.dir =3D=3D SPI_MEM_DATA_IN)
38278daad477e9 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-07-1=
4  427  			memcpy_fromio(op->data.buf.in, aq->mem + offset,
2e5c8888735864 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2019-02-0=
5  428  				      op->data.nbytes);
d5433def31531b drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-0=
5  429  		else
38278daad477e9 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-07-1=
4  430  			memcpy_toio(aq->mem + offset, op->data.buf.out,
2e5c8888735864 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2019-02-0=
5  431  				    op->data.nbytes);
d5433def31531b drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-0=
5  432  =

d5433def31531b drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-0=
5  433  		/* Release the chip-select */
c528ecfbef040b drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-03-2=
0  434  		atmel_qspi_write(QSPI_CR_LASTXFER, aq, QSPI_CR);
d5433def31531b drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-0=
5  435  	}
d5433def31531b drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-0=
5  436  =

d5433def31531b drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-0=
5  437  	/* Poll INSTRuction End status */
c528ecfbef040b drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-03-2=
0  438  	sr =3D atmel_qspi_read(aq, QSPI_SR);
d5433def31531b drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-0=
5  439  	if ((sr & QSPI_SR_CMD_COMPLETED) =3D=3D QSPI_SR_CMD_COMPLETED)
d5433def31531b drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-0=
5 @440  		return err;
d5433def31531b drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-0=
5  441  =

d5433def31531b drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-0=
5  442  	/* Wait for INSTRuction End interrupt */
d5433def31531b drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-0=
5  443  	reinit_completion(&aq->cmd_completion);
d5433def31531b drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-0=
5  444  	aq->pending =3D sr & QSPI_SR_CMD_COMPLETED;
c528ecfbef040b drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-03-2=
0  445  	atmel_qspi_write(QSPI_SR_CMD_COMPLETED, aq, QSPI_IER);
d5433def31531b drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-0=
5  446  	if (!wait_for_completion_timeout(&aq->cmd_completion,
d5433def31531b drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-0=
5  447  					 msecs_to_jiffies(1000)))
d5433def31531b drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-0=
5  448  		err =3D -ETIMEDOUT;
c528ecfbef040b drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-03-2=
0  449  	atmel_qspi_write(QSPI_SR_CMD_COMPLETED, aq, QSPI_IDR);
d5433def31531b drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-0=
5  450  =

d5433def31531b drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-0=
5  451  	return err;
d5433def31531b drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-0=
5  452  }
d5433def31531b drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-0=
5  453  =


:::::: The code at line 440 was first introduced by commit
:::::: d5433def31531bd07984f167f6ab0afef70b6a3e mtd: spi-nor: atmel-quadspi=
: Add spi-mem support to atmel-quadspi

:::::: TO: Piotr Bugalski <bugalski.piotr@gmail.com>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8170958621108048751==--

