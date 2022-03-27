Content-Type: multipart/mixed; boundary="===============1192353730323512669=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15 978/1024] drivers/mtd/spi-nor/core.c:2698:3: warning: Value stored to 'wanted_size' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 27 Mar 2022 22:12:57 +0800
Message-ID: <202203272208.1KiwJsyC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1192353730323512669==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15
head:   aceb8dba4813e07934d2847fdaf8bdfaaf9f622c
commit: bcc0b7fb0ef17a4481a02e10e3b61b0dddebf782 [978/1024] mtd: spi-nor: A=
void updating the flash_info struct in dual and stacked modes
:::::: branch date: 4 days ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-c006-20220327 (https://download.01.org/0day-ci/arc=
hive/20220327/202203272208.1KiwJsyC-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/Xilinx/linux-xlnx/commit/bcc0b7fb0ef17a4481a02=
e10e3b61b0dddebf782
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15
        git checkout bcc0b7fb0ef17a4481a02e10e3b61b0dddebf782
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/mtd/spi-nor/core.c:3552:6: note: Assuming the condition is false
           if (info->flags & SPI_NOR_HAS_LOCK)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/core.c:3552:2: note: Taking false branch
           if (info->flags & SPI_NOR_HAS_LOCK)
           ^
   drivers/mtd/spi-nor/core.c:3556:6: note: Assuming the condition is false
           if (info->flags & SST_WRITE)
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/core.c:3556:2: note: Taking false branch
           if (info->flags & SST_WRITE)
           ^
   drivers/mtd/spi-nor/core.c:3562:8: note: Calling 'spi_nor_init_params'
           ret =3D spi_nor_init_params(nor);
                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/core.c:3053:6: note: Assuming field 'params' is non-=
null
           if (!nor->params)
               ^~~~~~~~~~~~
   drivers/mtd/spi-nor/core.c:3053:2: note: Taking false branch
           if (!nor->params)
           ^
   drivers/mtd/spi-nor/core.c:3056:2: note: Calling 'spi_nor_info_init_para=
ms'
           spi_nor_info_init_params(nor);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/core.c:2879:6: note: Assuming field 'isstacked' is f=
alse
           if (nor->isstacked)
               ^~~~~~~~~~~~~~
   drivers/mtd/spi-nor/core.c:2879:2: note: Taking false branch
           if (nor->isstacked)
           ^
   drivers/mtd/spi-nor/core.c:2882:6: note: Assuming field 'isparallel' is =
false
           if (nor->isparallel) {
               ^~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/core.c:2882:2: note: Taking false branch
           if (nor->isparallel) {
           ^
   drivers/mtd/spi-nor/core.c:2890:6: note: Assuming the condition is false
           if (!(info->flags & SPI_NOR_NO_FR)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/core.c:2890:2: note: Taking false branch
           if (!(info->flags & SPI_NOR_NO_FR)) {
           ^
   drivers/mtd/spi-nor/core.c:2905:6: note: Assuming the condition is false
           if (params->hwcaps.mask & SNOR_HWCAPS_READ_FAST)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/core.c:2905:2: note: Taking false branch
           if (params->hwcaps.mask & SNOR_HWCAPS_READ_FAST)
           ^
   drivers/mtd/spi-nor/core.c:2910:6: note: Assuming the condition is false
           if (info->flags & SPI_NOR_DUAL_READ) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/core.c:2910:2: note: Taking false branch
           if (info->flags & SPI_NOR_DUAL_READ) {
           ^
   drivers/mtd/spi-nor/core.c:2917:6: note: Assuming the condition is false
           if (info->flags & SPI_NOR_QUAD_READ) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/core.c:2917:2: note: Taking false branch
           if (info->flags & SPI_NOR_QUAD_READ) {
           ^
   drivers/mtd/spi-nor/core.c:2924:6: note: Assuming the condition is false
           if (info->flags & SPI_NOR_OCTAL_READ) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/core.c:2924:2: note: Taking false branch
           if (info->flags & SPI_NOR_OCTAL_READ) {
           ^
   drivers/mtd/spi-nor/core.c:2931:6: note: Assuming the condition is false
           if (info->flags & SPI_NOR_OCTAL_DTR_READ) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/core.c:2931:2: note: Taking false branch
           if (info->flags & SPI_NOR_OCTAL_DTR_READ) {
           ^
   drivers/mtd/spi-nor/core.c:2943:6: note: Assuming the condition is false
           if (info->flags & SPI_NOR_OCTAL_DTR_PP) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/core.c:2943:2: note: Taking false branch
           if (info->flags & SPI_NOR_OCTAL_DTR_PP) {
           ^
   drivers/mtd/spi-nor/core.c:2959:6: note: Assuming the condition is false
           if (info->flags & SECT_4K_PMC) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/core.c:2959:2: note: Taking false branch
           if (info->flags & SECT_4K_PMC) {
           ^
   drivers/mtd/spi-nor/core.c:2964:13: note: Assuming the condition is false
           } else if (info->flags & SECT_4K) {
                      ^~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/core.c:2964:9: note: Taking false branch
           } else if (info->flags & SECT_4K) {
                  ^
   drivers/mtd/spi-nor/core.c:2971:2: note: Calling 'spi_nor_set_erase_type'
           spi_nor_set_erase_type(&map->erase_type[i], sector_size,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/core.c:2544:2: note: The value 4294967295 is assigne=
d to field 'size_shift'
           erase->size_shift =3D ffs(erase->size) - 1;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/core.c:2545:24: note: The result of the left shift i=
s undefined due to shifting by '4294967295', which is greater or equal to t=
he width of type 'int'
           erase->size_mask =3D (1 << erase->size_shift) - 1;
                                 ^  ~~~~~~~~~~~~~~~~~
>> drivers/mtd/spi-nor/core.c:2698:3: warning: Value stored to 'wanted_size=
' is never read [clang-analyzer-deadcode.DeadStores]
                   wanted_size <<=3D 1;
                   ^               ~
   drivers/mtd/spi-nor/core.c:2698:3: note: Value stored to 'wanted_size' i=
s never read
                   wanted_size <<=3D 1;
                   ^               ~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/char/hw_random/cctrng.c:136:17: warning: Value stored to 'dev' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &(drvdata->pdev->dev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/cctrng.c:136:17: note: Value stored to 'dev' duri=
ng its initialization is never read
           struct device *dev =3D &(drvdata->pdev->dev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/cctrng.c:165:17: warning: Value stored to 'dev' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &(drvdata->pdev->dev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/cctrng.c:165:17: note: Value stored to 'dev' duri=
ng its initialization is never read
           struct device *dev =3D &(drvdata->pdev->dev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/cctrng.c:278:17: warning: Value stored to 'dev' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &(drvdata->pdev->dev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/cctrng.c:278:17: note: Value stored to 'dev' duri=
ng its initialization is never read
           struct device *dev =3D &(drvdata->pdev->dev);
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/spi/spi.c:3116:2: warning: Argument to kfree() is offset by -368=
 bytes from the start of memory allocated by kmalloc() [clang-analyzer-unix=
.Malloc]
           kfree(sres);
           ^
   drivers/spi/spi.c:3578:6: note: Assuming the condition is false
           if (list_empty(&message->transfers))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:3578:2: note: Taking false branch
           if (list_empty(&message->transfers))
           ^
   drivers/spi/spi.c:3587:7: note: Assuming the condition is true
           if ((spi->mode & SPI_CS_WORD) && (!(ctlr->mode_bits & SPI_CS_WOR=
D) ||
                ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:3587:6: note: Left side of '&&' is true
           if ((spi->mode & SPI_CS_WORD) && (!(ctlr->mode_bits & SPI_CS_WOR=
D) ||
               ^
   drivers/spi/spi.c:3587:36: note: Assuming the condition is true
           if ((spi->mode & SPI_CS_WORD) && (!(ctlr->mode_bits & SPI_CS_WOR=
D) ||
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/spi/spi.c:3587:69: note: Left side of '||' is true
           if ((spi->mode & SPI_CS_WORD) && (!(ctlr->mode_bits & SPI_CS_WOR=
D) ||
                                                                           =
   ^
   drivers/spi/spi.c:3598:9: note: Calling 'spi_split_transfers_maxsize'
                   ret =3D spi_split_transfers_maxsize(ctlr, message, maxsi=
ze,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi.c:3376:2: note: Left side of '&&' is false
           list_for_each_entry(xfer, &msg->transfers, transfer_list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/spi/spi.c:3376:2: note: Taking false branch
           list_for_each_entry(xfer, &msg->transfers, transfer_list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'

vim +/wanted_size +2698 drivers/mtd/spi-nor/core.c

2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2688  =

3a960339e08e16 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
8  2689  static int spi_nor_select_erase(struct spi_nor *nor)
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2690  {
829ec6408dc58d drivers/mtd/spi-nor/core.c    Tudor Ambarus        2020-03-1=
3  2691  	struct spi_nor_erase_map *map =3D &nor->params->erase_map;
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2692  	const struct spi_nor_erase_type *erase =3D NULL;
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2693  	struct mtd_info *mtd =3D &nor->mtd;
3a960339e08e16 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
8  2694  	u32 wanted_size =3D nor->info->sector_size;
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2695  	int i;
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2696  =

bcc0b7fb0ef17a drivers/mtd/spi-nor/core.c    Sai Krishna Potthuri 2022-03-0=
8  2697  	if (nor->isparallel)
bcc0b7fb0ef17a drivers/mtd/spi-nor/core.c    Sai Krishna Potthuri 2022-03-0=
8 @2698  		wanted_size <<=3D 1;
bcc0b7fb0ef17a drivers/mtd/spi-nor/core.c    Sai Krishna Potthuri 2022-03-0=
8  2699  =

2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  2700  	if (mtd->erasesize &&
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  2701  	    nor->jedec_id !=3D CFI_MFR_AMD)
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  2702  		return 0;
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2703  	/*
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2704  	 * The previous implementation handling Sector Erase commands ass=
umed
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2705  	 * that the SPI flash memory has an uniform layout then used only=
 one
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2706  	 * of the supported erase sizes for all Sector Erase commands.
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2707  	 * So to be backward compatible, the new implementation also trie=
s to
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2708  	 * manage the SPI flash memory as uniform with a single erase sec=
tor
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2709  	 * size, when possible.
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2710  	 */
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2711  #ifdef CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2712  	/* prefer "small sector" erase if possible */
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2713  	wanted_size =3D 4096u;
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2714  #endif
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2715  =

2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2716  	if (spi_nor_has_uniform_erase(nor)) {
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2717  		erase =3D spi_nor_select_uniform_erase(map, wanted_size);
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2718  		if (!erase)
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2719  			return -EINVAL;
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2720  		nor->erase_opcode =3D erase->opcode;
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2721  		mtd->erasesize =3D erase->size;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  2722  		if (nor->shift)
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  2723  			mtd->erasesize =3D mtd->erasesize << nor->shift;
2747bc2106aa42 drivers/mtd/spi-nor/core.c    Amit Kumar Mahapatra 2022-01-2=
5  2724  =

2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2725  		return 0;
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2726  	}
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2727  =

2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2728  	/*
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2729  	 * For non-uniform SPI flash memory, set mtd->erasesize to the
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2730  	 * maximum erase sector size. No need to set nor->erase_opcode.
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2731  	 */
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2732  	for (i =3D SNOR_ERASE_TYPE_MAX - 1; i >=3D 0; i--) {
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2733  		if (map->erase_type[i].size) {
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2734  			erase =3D &map->erase_type[i];
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2735  			break;
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2736  		}
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2737  	}
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2738  =

2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2739  	if (!erase)
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2740  		return -EINVAL;
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2741  =

2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2742  	mtd->erasesize =3D erase->size;
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2743  	return 0;
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2744  }
2d7ff858e5f683 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus        2019-08-2=
5  2745  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1192353730323512669==--

