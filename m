Content-Type: multipart/mixed; boundary="===============2338401343100977888=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ambarus:spi-nor/next-clean-v5 20/25] drivers/mtd/spi-nor/core.c:2720 spi_nor_init_params_deprecated() warn: should this be a bitwise op?
Date: Mon, 06 Dec 2021 23:16:02 +0800
Message-ID: <202112062341.u7kBv9Hp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2338401343100977888==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Tudor Ambarus <tudor.ambarus@microchip.com>

tree:   https://github.com/ambarus/linux-0day spi-nor/next-clean-v5
head:   d643e0f7de527f4ccf909025478949a961440ac8
commit: d3c97258de8777fd69e982ff804b97a4fc3372a9 [20/25] mtd: spi-nor: core=
: Init all flash parameters based on SFDP where possible
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-m021-20211206 (https://download.01.org/0day-ci/arch=
ive/20211206/202112062341.u7kBv9Hp-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/mtd/spi-nor/core.c:2720 spi_nor_init_params_deprecated() warn: shou=
ld this be a bitwise op?

Old smatch warnings:
drivers/mtd/spi-nor/core.c:1544 spi_nor_init_erase_cmd_list() warn: passing=
 a valid pointer to 'PTR_ERR'
drivers/mtd/spi-nor/core.c:1558 spi_nor_init_erase_cmd_list() warn: passing=
 a valid pointer to 'PTR_ERR'

vim +2720 drivers/mtd/spi-nor/core.c

d3c97258de8777 Tudor Ambarus 2021-11-22  2704  =

d3c97258de8777 Tudor Ambarus 2021-11-22  2705  /**
d3c97258de8777 Tudor Ambarus 2021-11-22  2706   * spi_nor_init_params_depre=
cated() - Deprecated way of initializing flash
d3c97258de8777 Tudor Ambarus 2021-11-22  2707   * parameters and settings.
d3c97258de8777 Tudor Ambarus 2021-11-22  2708   * @nor:	pointer to a 'struc=
t spi_nor'.
d3c97258de8777 Tudor Ambarus 2021-11-22  2709   *
d3c97258de8777 Tudor Ambarus 2021-11-22  2710   * The method assumes that f=
lash doesn't support SFDP so it initializes flash
d3c97258de8777 Tudor Ambarus 2021-11-22  2711   * parameters in spi_nor_no_=
sfdp_init_params() which later on can be overwritten
d3c97258de8777 Tudor Ambarus 2021-11-22  2712   * when parsing SFDP, if sup=
ported.
d3c97258de8777 Tudor Ambarus 2021-11-22  2713   */
d3c97258de8777 Tudor Ambarus 2021-11-22  2714  static void spi_nor_init_par=
ams_deprecated(struct spi_nor *nor)
d3c97258de8777 Tudor Ambarus 2021-11-22  2715  {
d3c97258de8777 Tudor Ambarus 2021-11-22  2716  	spi_nor_no_sfdp_init_params=
(nor);
d3c97258de8777 Tudor Ambarus 2021-11-22  2717  =

d3c97258de8777 Tudor Ambarus 2021-11-22  2718  	spi_nor_manufacturer_init_p=
arams(nor);
d3c97258de8777 Tudor Ambarus 2021-11-22  2719  =

d3c97258de8777 Tudor Ambarus 2021-11-22 @2720  	if ((SPI_NOR_DUAL_READ | SP=
I_NOR_QUAD_READ | SPI_NOR_OCTAL_READ |
d3c97258de8777 Tudor Ambarus 2021-11-22  2721  	     SPI_NOR_OCTAL_DTR_READ=
) &&
d3c97258de8777 Tudor Ambarus 2021-11-22  2722  	    !(nor->info->no_sfdp_fl=
ags & SPI_NOR_SKIP_SFDP))
d3c97258de8777 Tudor Ambarus 2021-11-22  2723  		spi_nor_sfdp_init_params_d=
eprecated(nor);
d3c97258de8777 Tudor Ambarus 2021-11-22  2724  }
d3c97258de8777 Tudor Ambarus 2021-11-22  2725  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2338401343100977888==--

