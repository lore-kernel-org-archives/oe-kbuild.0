Content-Type: multipart/mixed; boundary="===============8809774376282314327=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/spi/atmel-quadspi.c:446:10: warning: Identical condition 'err', second condition is always false
Date: Sun, 22 Nov 2020 06:26:21 +0800
Message-ID: <202011220618.Ma8AV2E6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8809774376282314327==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a349e4c659609fd20e4beea89e5c4a4038e33a95
commit: b780c3f38812bce7d7baebe2108738a043d6c4c3 spi: atmel-quadspi: Use op=
timezed memcpy_fromio()/memcpy_toio()
date:   4 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 months ago
compiler: riscv64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/spi/atmel-quadspi.c:446:10: warning: Identical condition 'err', =
second condition is always false [identicalConditionAfterEarlyExit]
     return err;
            ^
   drivers/spi/atmel-quadspi.c:423:6: note: first condition
    if (err)
        ^
   drivers/spi/atmel-quadspi.c:446:10: note: second condition
     return err;
            ^

vim +/err +446 drivers/spi/atmel-quadspi.c

2e5c88887358640 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2019-02-=
05  407  =

2e5c88887358640 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2019-02-=
05  408  static int atmel_qspi_exec_op(struct spi_mem *mem, const struct sp=
i_mem_op *op)
2e5c88887358640 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2019-02-=
05  409  {
2e5c88887358640 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2019-02-=
05  410  	struct atmel_qspi *aq =3D spi_controller_get_devdata(mem->spi->ma=
ster);
2e5c88887358640 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2019-02-=
05  411  	u32 sr, offset;
2e5c88887358640 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2019-02-=
05  412  	int err;
2e5c88887358640 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2019-02-=
05  413  =

8e093ea4d359337 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-02-=
28  414  	/*
8e093ea4d359337 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-02-=
28  415  	 * Check if the address exceeds the MMIO window size. An improvem=
ent
8e093ea4d359337 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-02-=
28  416  	 * would be to add support for regular SPI mode and fall back to =
it
8e093ea4d359337 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-02-=
28  417  	 * when the flash memories overrun the controller's memory space.
8e093ea4d359337 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-02-=
28  418  	 */
8e093ea4d359337 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-02-=
28  419  	if (op->addr.val + op->data.nbytes > aq->mmap_size)
8e093ea4d359337 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-02-=
28  420  		return -ENOTSUPP;
8e093ea4d359337 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-02-=
28  421  =

2e5c88887358640 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2019-02-=
05  422  	err =3D atmel_qspi_set_cfg(aq, op, &offset);
2e5c88887358640 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2019-02-=
05  423  	if (err)
2e5c88887358640 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2019-02-=
05  424  		return err;
d5433def31531bd drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-=
05  425  =

d5433def31531bd drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-=
05  426  	/* Skip to the final steps if there is no data */
d5433def31531bd drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-=
05  427  	if (op->data.nbytes) {
d5433def31531bd drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-=
05  428  		/* Dummy read of QSPI_IFR to synchronize APB and AHB accesses */
c528ecfbef040ba drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-03-=
20  429  		(void)atmel_qspi_read(aq, QSPI_IFR);
d5433def31531bd drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-=
05  430  =

d5433def31531bd drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-=
05  431  		/* Send/Receive data */
d5433def31531bd drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-=
05  432  		if (op->data.dir =3D=3D SPI_MEM_DATA_IN)
b780c3f38812bce drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-07-=
16  433  			memcpy_fromio(op->data.buf.in, aq->mem + offset,
2e5c88887358640 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2019-02-=
05  434  				      op->data.nbytes);
d5433def31531bd drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-=
05  435  		else
b780c3f38812bce drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-07-=
16  436  			memcpy_toio(aq->mem + offset, op->data.buf.out,
2e5c88887358640 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2019-02-=
05  437  				    op->data.nbytes);
d5433def31531bd drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-=
05  438  =

d5433def31531bd drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-=
05  439  		/* Release the chip-select */
c528ecfbef040ba drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-03-=
20  440  		atmel_qspi_write(QSPI_CR_LASTXFER, aq, QSPI_CR);
d5433def31531bd drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-=
05  441  	}
d5433def31531bd drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-=
05  442  =

d5433def31531bd drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-=
05  443  	/* Poll INSTRuction End status */
c528ecfbef040ba drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-03-=
20  444  	sr =3D atmel_qspi_read(aq, QSPI_SR);
d5433def31531bd drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-=
05  445  	if ((sr & QSPI_SR_CMD_COMPLETED) =3D=3D QSPI_SR_CMD_COMPLETED)
d5433def31531bd drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-=
05 @446  		return err;
d5433def31531bd drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-=
05  447  =

d5433def31531bd drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-=
05  448  	/* Wait for INSTRuction End interrupt */
d5433def31531bd drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-=
05  449  	reinit_completion(&aq->cmd_completion);
d5433def31531bd drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-=
05  450  	aq->pending =3D sr & QSPI_SR_CMD_COMPLETED;
c528ecfbef040ba drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-03-=
20  451  	atmel_qspi_write(QSPI_SR_CMD_COMPLETED, aq, QSPI_IER);
d5433def31531bd drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-=
05  452  	if (!wait_for_completion_timeout(&aq->cmd_completion,
d5433def31531bd drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-=
05  453  					 msecs_to_jiffies(1000)))
d5433def31531bd drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-=
05  454  		err =3D -ETIMEDOUT;
c528ecfbef040ba drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-03-=
20  455  	atmel_qspi_write(QSPI_SR_CMD_COMPLETED, aq, QSPI_IDR);
d5433def31531bd drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-=
05  456  =

d5433def31531bd drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-=
05  457  	return err;
d5433def31531bd drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-=
05  458  }
d5433def31531bd drivers/mtd/spi-nor/atmel-quadspi.c Piotr Bugalski 2018-11-=
05  459  =


:::::: The code at line 446 was first introduced by commit
:::::: d5433def31531bd07984f167f6ab0afef70b6a3e mtd: spi-nor: atmel-quadspi=
: Add spi-mem support to atmel-quadspi

:::::: TO: Piotr Bugalski <bugalski.piotr@gmail.com>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8809774376282314327==--

