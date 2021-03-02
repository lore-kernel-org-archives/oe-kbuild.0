Content-Type: multipart/mixed; boundary="===============3843599708500649537=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/spi/spi-cadence-quadspi.c:250:18: warning: Shifting signed 32-bit value by 31 bits is undefined behaviour
Date: Tue, 02 Mar 2021 19:49:03 +0800
Message-ID: <202103021955.GCQxLRuR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3843599708500649537==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.c=
om>
CC: Mark Brown <broonie@kernel.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7a7fd0de4a9804299793e564a555a49c1fc924cb
commit: 31fb632b5d43ca16713095b3a4fe17e3d7331e28 spi: Move cadence-quadspi =
driver to drivers/spi/
date:   9 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 9 months ago
compiler: nds32le-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/spi/spi-cadence-quadspi.c:250:18: warning: Shifting signed 32-bi=
t value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    return reg & (1 << CQSPI_REG_CONFIG_IDLE_LSB);
                    ^

vim +250 drivers/spi/spi-cadence-quadspi.c

14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c Graham Moore 2016-06-0=
4  245  =

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
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c Graham Moore 2016-06-0=
4  251  }
14062341053690 drivers/mtd/spi-nor/cadence-quadspi.c Graham Moore 2016-06-0=
4  252  =


:::::: The code@line 250 was first introduced by commit
:::::: 140623410536905fa6ab737b625decfde6c64a72 mtd: spi-nor: Add driver fo=
r Cadence Quad SPI Flash Controller

:::::: TO: Graham Moore <grmoore@opensource.altera.com>
:::::: CC: Brian Norris <computersforpeace@gmail.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3843599708500649537==--

