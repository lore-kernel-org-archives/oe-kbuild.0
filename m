Content-Type: multipart/mixed; boundary="===============3373024441879876784=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ambarus:spi-nor/next-clean-v4bis-sent 19/24] drivers/mtd/spi-nor/core.c:2720 spi_nor_init_params_deprecated() warn: should this be a bitwise op?
Date: Thu, 25 Nov 2021 01:55:22 +0800
Message-ID: <202111250118.loeFlVbe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3373024441879876784==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Tudor Ambarus <tudor.ambarus@microchip.com>

tree:   https://github.com/ambarus/linux-0day spi-nor/next-clean-v4bis-sent
head:   088cf85cc4ef6d55a30cfab8ec33db3f1b15b777
commit: 40e3789d75cb97ab687d84fe7190dab363a758a0 [19/24] mtd: spi-nor: core=
: Init all flash parameters based on SFDP where possible
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: nios2-randconfig-m031-20211123 (https://download.01.org/0day-ci/arc=
hive/20211125/202111250118.loeFlVbe-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/mtd/spi-nor/core.c:2720 spi_nor_init_params_deprecated() warn: shou=
ld this be a bitwise op?

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:71 current_thread_info() error: uninit=
ialized symbol 'sp'.
drivers/mtd/spi-nor/core.c:1544 spi_nor_init_erase_cmd_list() warn: passing=
 a valid pointer to 'PTR_ERR'
drivers/mtd/spi-nor/core.c:1558 spi_nor_init_erase_cmd_list() warn: passing=
 a valid pointer to 'PTR_ERR'

vim +2720 drivers/mtd/spi-nor/core.c

40e3789d75cb97 Tudor Ambarus 2021-10-29  2704  =

40e3789d75cb97 Tudor Ambarus 2021-10-29  2705  /**
40e3789d75cb97 Tudor Ambarus 2021-10-29  2706   * spi_nor_init_params_depre=
cated() - Deprecated way of initializing flash
40e3789d75cb97 Tudor Ambarus 2021-10-29  2707   * parameters and settings.
40e3789d75cb97 Tudor Ambarus 2021-10-29  2708   * @nor:	pointer to a 'struc=
t spi_nor'.
40e3789d75cb97 Tudor Ambarus 2021-10-29  2709   *
40e3789d75cb97 Tudor Ambarus 2021-10-29  2710   * The method assumes that f=
lash doesn't support SFDP so it initializes flash
40e3789d75cb97 Tudor Ambarus 2021-10-29  2711   * parameters in spi_nor_no_=
sfdp_init_params() which later on can be overwritten
40e3789d75cb97 Tudor Ambarus 2021-10-29  2712   * when parsing SFDP, if sup=
ported.
40e3789d75cb97 Tudor Ambarus 2021-10-29  2713   */
40e3789d75cb97 Tudor Ambarus 2021-10-29  2714  static void spi_nor_init_par=
ams_deprecated(struct spi_nor *nor)
40e3789d75cb97 Tudor Ambarus 2021-10-29  2715  {
40e3789d75cb97 Tudor Ambarus 2021-10-29  2716  	spi_nor_no_sfdp_init_params=
(nor);
40e3789d75cb97 Tudor Ambarus 2021-10-29  2717  =

40e3789d75cb97 Tudor Ambarus 2021-10-29  2718  	spi_nor_manufacturer_init_p=
arams(nor);
40e3789d75cb97 Tudor Ambarus 2021-10-29  2719  =

40e3789d75cb97 Tudor Ambarus 2021-10-29 @2720  	if ((SPI_NOR_DUAL_READ | SP=
I_NOR_QUAD_READ | SPI_NOR_OCTAL_READ |
40e3789d75cb97 Tudor Ambarus 2021-10-29  2721  	     SPI_NOR_OCTAL_DTR_READ=
) &&
40e3789d75cb97 Tudor Ambarus 2021-10-29  2722  	    !(nor->info->no_sfdp_fl=
ags & SPI_NOR_SKIP_SFDP))
40e3789d75cb97 Tudor Ambarus 2021-10-29  2723  		spi_nor_sfdp_init_params_d=
eprecated(nor);
40e3789d75cb97 Tudor Ambarus 2021-10-29  2724  }
40e3789d75cb97 Tudor Ambarus 2021-10-29  2725  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3373024441879876784==--

