Content-Type: multipart/mixed; boundary="===============6951560318314545046=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: drivers/spi/spi-cadence-quadspi.c:250:18: warning: Shifting signed 32-bit value by 31 bits is undefined behaviour
Date: Tue, 02 Mar 2021 15:11:25 +0300
Message-ID: <20210302121125.GU2222@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6951560318314545046==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
 master
head:   7a7fd0de4a9804299793e564a555a49c1fc924cb
commit: 31fb632b5d43ca16713095b3a4fe17e3d7331e28 spi: Move cadence-quadspi =
driver to drivers/spi/
compiler: nds32le-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/spi/spi-cadence-quadspi.c:250:18: warning: Shifting signed 32-bi=
t value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    return reg & (1 << CQSPI_REG_CONFIG_IDLE_LSB);

vim +250 drivers/spi/spi-cadence-quadspi.c

14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c Graham Moore 2016-06-0=
4  246  static bool cqspi_is_idle(struct cqspi_st *cqspi)
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c Graham Moore 2016-06-0=
4  247  {
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c Graham Moore 2016-06-0=
4  248  	u32 reg =3D readl(cqspi->iobase + CQSPI_REG_CONFIG);
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c Graham Moore 2016-06-0=
4  249  =

14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c Graham Moore 2016-06-0=
4 @250  	return reg & (1 << CQSPI_REG_CONFIG_IDLE_LSB);
                                                                           =
                                ^^^^^^^^^^^^^^^^^^^^^^^^^
CQSPI_REG_CONFIG_IDLE_LSB is 31 and reg is a u32 so this is very
puzzling.

14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c Graham Moore 2016-06-0=
4  251  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org =

_______________________________________________
kbuild mailing list -- kbuild(a)lists.01.org
To unsubscribe send an email to kbuild-leave@lists.01.org
--===============6951560318314545046==--

